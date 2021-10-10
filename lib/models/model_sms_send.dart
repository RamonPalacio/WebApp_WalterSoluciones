// To parse this JSON data, do
//
//     final smsSend = smsSendFromJson(jsonString);

import 'dart:convert';

SMS smsFromJson(String str) => SMS.fromJson(json.decode(str));

String smsToJson(SMS data) => json.encode(data.toJson());

class SMS {
  SMS({
    required this.successful,
    required this.data,
  });

  bool successful;
  Data data;

  factory SMS.fromJson(Map<String, dynamic> json) => SMS(
        successful: json["successful"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "successful": successful,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.otp,
    this.sid,
  });

  String? otp;
  String? sid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json["otp"],
        sid: json["sid"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "sid": sid,
      };
}
