import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:walte_soluciones/constant/url_sourse.dart';
import 'package:walte_soluciones/data/models/model_etiquetas.dart';
import 'package:walte_soluciones/data/models/model_get_address_data.dart';
import 'package:walte_soluciones/data/models/model_trakermap.dart';

class EndPointApi {
  EndPointApi();

  Future<List<String>> getMockEtiquetas() async {
    return await Future.delayed(const Duration(milliseconds: 5000), () {
      return ["hola", "como estas"];
    });
  }

  Future<List<String>> getEtiquetas() async {
    Uri url = UrlSource().loremList;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'authorization': 'Bearer $accessToken'
    };

    // Map data = {
    //   "notification": {"body": message, "title": title},
    //   "priority": "high",
    //   "data": {
    //     "click_action": "FLUTTER_NOTIFICATION_CLICK",
    //     "id": "1",
    //     "userId": userId
    //   },
    //   "to": "/topics/allWalters"
    // };
    // var body = jsonEncode(data);
    try {
      var response = await http.get(
        url,
        headers: headers,
        // body: body,
      );
      return etiquetasFromJson(response.body);
    } catch (e) {
      return etiquetasFromJson("[]");
    }
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
