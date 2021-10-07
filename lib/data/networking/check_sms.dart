import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:walte_soluciones/data/model.dart';
import 'package:walte_soluciones/data/models/sms_check.dart';
import 'package:walte_soluciones/data/models/sms_send.dart';

Future<SmsCheck> checkSMS(String phone, int otp) async {
  ServerUrl server = ServerUrl();
  var url = Uri.parse(server.checkOTP);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  Response response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(<String, dynamic>{
      "phone_number": "+57$phone",
      "otp": otp,
    }),
  );

  return smsCheckFromJson(response.body);
}
