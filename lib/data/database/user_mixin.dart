import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/app_poppages.dart';
import 'package:walte_soluciones/constant/states_fields.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/provider/BLoC/verifications.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/data/models/user.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

abstract class Users {
  Future<Map<String, dynamic>> getUsers(String phone) async {
    QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore.instance
        .collection('users')
        .where("phone", isEqualTo: phone)
        .get();
    Map<String, dynamic> result = {"phone": false};
    if (where.docs.isNotEmpty) {
      for (var i in where.docs) {
        result = i.data();
      }
    }
    // print("Resutlado getUSER:$result");
    return result;
  }

  void clickOpenPopLogIn(BuildContext c) {
    c.read<MainState>().setState(
          id: PagesShowState.singinshow,
          texto: true,
          updateGeneralState: false,
        );
  }

  void clickLogIn(BuildContext c) async {
    Verifications utilitys = Verifications();
    final MainState mainState = c.read<MainState>();
    final String celularText = mainState.getState(TxtStateName.phoneSignin);

    ///Muestra el Loading
    mainState.setState(
        id: ConstState.isLoading, texto: true, updateGeneralState: true);

    if (!utilitys.verificarCelular(celularText)) {
      // showMensaje("Ingrese un número celular válido");
      mainState.setState(
        id: ConstState.isLoading,
        texto: false,
        updateGeneralState: true,
      );
      return;
    }
  }

  Future<String> getAutoIdFirebase(String? phone) async {
    String response = "";
    QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore.instance
        .collection('users')
        .where("phone", isEqualTo: phone)
        .get();

    if (where.docs.isNotEmpty) {
      for (var element in where.docs) {
        response = element.id;
      }
    }
    return response;
  }

  Future<User> getUserFirebase(String? phone) async {
    QueryDocumentSnapshot<Map<String, dynamic>>? element;
    Map<String, dynamic> response = {};
    try {
      QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore
          .instance
          .collection('users')
          .where("phone", isEqualTo: phone)
          .get();

      if (where.docs.isNotEmpty) {
        for (element in where.docs) {
          response.addAll({"autoId": element.id});
          response.addAll(element.data());
        }
      } else {
        response.addAll({"autoId": ""});
      }
      return userFromJson(jsonEncode(response));
    } catch (e) {
      response.addAll({"autoId": ""});
      return userFromJson(jsonEncode(response));
    }
  }
}
