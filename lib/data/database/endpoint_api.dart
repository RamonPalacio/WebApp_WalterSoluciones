import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:walte_soluciones/data/database/user_mixin.dart';
import 'package:walte_soluciones/data/database/sms_mixin.dart';
import 'package:walte_soluciones/data/models/model_coordenadas.dart';
import 'package:walte_soluciones/data/models/model_trakermap.dart';
import 'getcoordenada_mixin.dart';
import 'getetiquetas_mixin.dart';

class EndPointApi with GetCoordenadas, GetEtiquetas, Users, SendSMS {
  EndPointApi();

  Future<List<String>> getUbicacion(String address) async {
    Coordenadas response = await getCoordenadas(address);
    // ignore: avoid_print
    print(response.status); // OK
    double? lat, lng;
    String? direccion;
    List<String> direcciones = [];

    for (var e in response.results) {
      //Garantiza no tener datos null

      direcciones.add(
          ("${e.formattedAddress}\nlat:${e.geometry.location.lat} lng:${e.geometry.location.lng}"));

      lat ??= e.geometry.location.lat;
      lng ??= e.geometry.location.lng;
      direccion ??= e.formattedAddress;
    }
    // ignore: avoid_print
    // print("Latitud:$lat , Logintud: $lng \nDireccion: $direccion");
    // return "Latitud:$lat , Logintud: $lng \nDireccion: $direccion";
    return direcciones;
  }

  Future<Map<String, dynamic>> addUsers(
      {required Map<String, dynamic> user}) async {
    bool isCreate = false;
    await FirebaseFirestore.instance
        .collection('users')
        .add(user)
        .then((value) async {
      await value.update({
        "idUser": value.id,
        "id": value.id,
      });
      debugPrint("User Added:${value.id}");
      isCreate = true;
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
    if (isCreate) {
      return {"statusCode": 200};
    } else {
      return {"statusCode": 400};
    }

    // return {"statusCode": 404};
  }

  Future<List<List<double>>> getpoints(
      String longini, String latini, String longend, String latend) async {
    try {
      var url = Uri.parse(
          // "https://router.project-osrm.org/route/v1/driving/$longini,$latini;$longend,$latend?geometries=geojson");
          "https://router.project-osrm.org/route/v1/driving/-74.79317,10.94668;-74.80148,10.94366?geometries=geojson");
      var response = await http.get(url);
      TrakerMap ubicaciones = trakerMapFromJson(response.body);
      if (response.statusCode == 200) {
        return ubicaciones.routes[0].geometry.coordinates;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
