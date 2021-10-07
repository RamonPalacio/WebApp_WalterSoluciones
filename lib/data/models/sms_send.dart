// To parse this JSON data, do
//
//     final smsSend = smsSendFromJson(jsonString);

import 'dart:convert';

SmsSend smsSendFromJson(String str) => SmsSend.fromJson(json.decode(str));

String smsSendToJson(SmsSend data) => json.encode(data.toJson());

class SmsSend {
  SmsSend({
    required this.successful,
    required this.data,
  });

  bool successful;
  Data data;

  factory SmsSend.fromJson(Map<String, dynamic> json) => SmsSend(
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
