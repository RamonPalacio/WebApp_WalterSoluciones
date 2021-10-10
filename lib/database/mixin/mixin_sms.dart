import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:walte_soluciones/database/constant/url_sourse.dart';
import 'package:walte_soluciones/models/model_sms_send.dart';
import 'package:walte_soluciones/models/model_sms_check.dart';

abstract class SendSMS {
  /// Envia un SMS al numero indicado con un Codigo OTP.
  Future<SMS> sendSMS(String phone) async {
    var url = Uri.parse(UrlSource().sendOTP);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(<String, String>{"phone_number": "+57$phone"}),
    );

    return smsFromJson(response.body);
  } //

  /// verifica que el OTP sea correcto para un numero indicado.
  Future<SmsCheck> checkSMS(String phone, int otp) async {
    Uri url = Uri.parse(UrlSource().checkOTP);

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
  //
}
