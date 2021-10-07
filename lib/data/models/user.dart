// To parse this JSON data, do
//
//     final user = userFromJson(jsonString?);

import 'dart:convert';

User userFromJson(String? str) => User.fromJson(json.decode(str ?? ''));

String? userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.birthDay,
    this.deviceToken,
    this.email,
    this.id,
    this.autoId,
    this.idUser,
    this.identityNumber,
    this.name,
    this.lastname,
    this.paymentMethod,
    this.phone,
    this.points,
    this.sex,
    this.subscriptionProfile,
    this.time,
    this.typeOfDocument,
    this.isCompany,
  });

  final String? birthDay;
  final String? deviceToken;
  final String? email;
  final String? id;
  final String? autoId;
  final String? idUser;
  final String? identityNumber;
  final String? name;
  final String? lastname;
  final int? paymentMethod;
  final String? phone;
  final int? points;
  final String? sex;
  final int? subscriptionProfile;
  final DateTime? time;
  final String? typeOfDocument;
  final bool? isCompany;

  factory User.fromJson(Map<String?, dynamic> json) => User(
        birthDay: json["birthDay"],
        deviceToken: json["deviceToken"],
        email: json["email"],
        id: json["id"],
        autoId: json["autoId"],
        idUser: json["idUser"],
        identityNumber: json["identityNumber"],
        name: json["name"],
        lastname: json["lastname"],
        paymentMethod: json["paymentMethod"],
        phone: json["phone"],
        points: json["points"],
        sex: json["sex"],
        subscriptionProfile: json["subscriptionProfile"],
        time: json["time"],
        typeOfDocument: json["typeOfDocument"],
        isCompany: json["isCompany"],
      );

  Map<String?, dynamic> toJson() => {
        "birthDay": birthDay,
        "deviceToken": deviceToken,
        "email": email,
        "id": id,
        "autoId": autoId,
        "idUser": idUser,
        "identityNumber": identityNumber,
        "name": name,
        "lastname": lastname,
        "paymentMethod": paymentMethod,
        "phone": phone,
        "points": points,
        "sex": sex,
        "subscriptionProfile": subscriptionProfile,
        "time": time,
        "typeOfDocument": typeOfDocument,
        "isCompany": isCompany,
      };
}
