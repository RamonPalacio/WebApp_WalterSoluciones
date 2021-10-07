import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:walte_soluciones/data/model.dart';
import 'package:walte_soluciones/data/models/sms_send.dart';
import 'package:walte_soluciones/data/models/user.dart';

Future<SmsSend> sendSMS(String phone) async {
  ServerUrl server = ServerUrl();
  var url = Uri.parse(server.sendOTP);

  // Map<String, String> headers = {
  //   'Content-Type': 'application/json',
  //   'authorization': 'Bearer $accessToken'
  // };

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  Response response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(<String, String>{"phone_number": "+57$phone"}),
  );

  return smsSendFromJson(response.body);
}
