import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walte_soluciones/app/app_state.dart';
import 'package:walte_soluciones/data/models/user.dart';

Future getAutoIdFirebase(String? phone) async {
  QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore.instance
      .collection('users')
      .where("phone", isEqualTo: phone)
      .get();

  if (where.docs.isNotEmpty) {
    for (var element in where.docs) {
      return element.id;
    }
  } else {
    return {};
  }
}

Future<User> getUserFirebase(String? phone) async {
  QueryDocumentSnapshot<Map<String, dynamic>>? element;
  Map<String, dynamic> response = {};
  try {
    QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore.instance
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
