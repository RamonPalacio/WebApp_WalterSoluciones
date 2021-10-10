// To parse this JSON data, do
//
//     final smsCheck = smsCheckFromJson(jsonString);

import 'dart:convert';

SmsCheck smsCheckFromJson(String str) => SmsCheck.fromJson(json.decode(str));

String smsCheckToJson(SmsCheck data) => json.encode(data.toJson());

class SmsCheck {
  SmsCheck({
    required this.successful,
    required this.message,
  });

  bool successful;
  String message;

  factory SmsCheck.fromJson(Map<String, dynamic> json) => SmsCheck(
        successful: json["successful"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "successful": successful,
        "message": message,
      };
}
