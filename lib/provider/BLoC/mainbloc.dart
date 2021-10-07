import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/app/app_poppages.dart';
import 'package:walte_soluciones/app/app_state.dart';
import 'package:walte_soluciones/app/app_textboxs.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/data/models/sms_check.dart';
import 'package:walte_soluciones/data/models/sms_send.dart';
import 'package:walte_soluciones/data/models/user.dart';
import 'package:walte_soluciones/data/networking/add_user_firebase.dart';
import 'package:walte_soluciones/data/networking/check_sms.dart';
import 'package:walte_soluciones/data/networking/get_autoid_firebase.dart';
import 'package:walte_soluciones/data/networking/get_user_firebase.dart';
import 'package:walte_soluciones/data/networking/send_sms.dart';
import 'package:walte_soluciones/provider/States/mainstate.dart';

enum clickEvents { editar, medellin, bogota, mexico }

class MainBLoC with ChangeNotifier {
  clickCity(BuildContext context, {String city = ""}) {
    if (city != "") {
      context.read<MainState>()
        ..setState(id: AppState.btnciudad, texto: city)
        ..setState(
          id: PagesShowState.cityshow,
          texto: false,
          showState: true,
        );
    } else {
      context.read<MainState>().setState(
            id: PagesShowState.cityshow,
            texto: true,
            showState: true,
          );
    }
  }

  clickTamano(BuildContext context, {String tamano = ""}) {
    if (tamano != "") {
      context.read<MainState>()
        ..setState(
          id: AppState.btntamano,
          texto: tamano,
        )
        ..setState(
          id: PagesShowState.tamanoshow,
          texto: false,
          showState: false,
        );
    } else {
      context.read<MainState>().setState(
            id: PagesShowState.tamanoshow,
            texto: true,
            showState: false,
          );
    }
  }

  clickOpenPopLogIn(BuildContext c) async {
    c.read<MainState>().setState(
          id: PagesShowState.singinshow,
          texto: true,
          showState: false,
        );
  }

  clickLogIn(BuildContext c) async {
    MainState cState = c.read<MainState>();
    String celularText = cState.getState(TxtState.phoneSignin);
    cState.setState(id: AppState.isLoading, texto: true, showState: true);
    final bool isMovilColombia = celularText.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);

    if (!isMovilColombia) {
      showMensaje("Ingrese un número celular válido");
      cState.setState(id: AppState.isLoading, texto: false, showState: true);
      return;
    }

    Map<String, dynamic> responseFirebase = await getUsers(celularText);

    if (responseFirebase['phone'].runtimeType != String) {
      showMensaje("Ingrese Un Número Celular Válido");
      cState.setState(id: AppState.isLoading, texto: false, showState: true);
      return;
    }

    SmsSend usuario = await sendSMS(celularText);
    if (usuario.successful) {
      c.read<MainBLoC>().resetPop(c);
      cState.setState(id: PagesShowState.otpshow, texto: true, showState: true);
    }
    cState.setState(id: AppState.isLoading, texto: false, showState: true);
  }

  endInputPincode(BuildContext c, String pinCode) async {
    MainState cState = c.read<MainState>();
    String celularText = cState.getState(TxtState.phoneSignin);

    SmsCheck smscheck = await checkSMS(
        cState.getState(TxtState.phoneSignin), int.parse(pinCode));

    if (smscheck.successful) {
      User userClient = await getUserFirebase(celularText);
      cState
        ..setState(
          id: AppState.userPhone,
          texto: userClient.phone,
        )
        ..setState(
            id: AppState.userName,
            texto: '${userClient.name} ${userClient.lastname}')
        ..setState(
          id: AppState.userEmail,
          texto: userClient.name,
        )
        ..setState(
          id: AppState.userAutoId,
          texto: userClient.autoId,
          showState: true,
        );
    } else {
      showMensaje("Validacion No exitosa", false);
    }

    c.read<MainBLoC>().resetPop(c);
  }

  clickLogOut(BuildContext context) {
    context.read<MainState>()
      ..removeState(AppState.userAutoId)
      ..removeState(AppState.userPhone)
      ..removeState(AppState.userName)
      ..removeState(AppState.userEmail);
  }

  clickPersonas(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.naturalshow,
          texto: true,
        );
  }

  clickRegistroPersonas(BuildContext c) async {
    String nombresText = c.read<MainState>().getState(TxtState.nombresReg);
    String apellidosText = c.read<MainState>().getState(TxtState.apellidoReg);
    String emailText = c.read<MainState>().getState(TxtState.emailReg);
    String phoneText = c.read<MainState>().getState(TxtState.phoneReg);

    final bool isMovilColombia = phoneText.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);

    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValidEmail = emailRegEx.hasMatch(emailText);

    if (nombresText.length < 3) {
      showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!isValidEmail) {
      showMensaje("Ingresa un Email válido");
      return;
    }

    if (!isMovilColombia) {
      showMensaje("Ingrese un número celular válido");
      return;
    }

//TODO_ implementar clases user mas adelante cuando el proyecto cresca
    Map<String, dynamic> user = {
      'id': "automatico",
      'idUser': "automatico",
      'name': nombresText,
      'lastname': apellidosText,
      'email': emailText,
      'phone': phoneText,
      'identityNumber': null,
      'sex': null,
      'birthDay': null,
      'points': 0,
      'subscriptionProfile': 0,
      'isCompany': false,
      'deviceToken': null,
    };

    Map<String, dynamic> responseFirebase = await getUsers(phoneText);

    if (responseFirebase['phone'].runtimeType != String) {
      showMensaje("Ingrese Un Número Celular Válido");
      return;
    }
    Map<String, dynamic>? result = await EndPointApi().addUsers(user: user);
    switch (result['statusCode']) {
      case 200:
        showMensaje(
            "Usuario Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
            false);
        c.read<MainBLoC>().resetPop(c);
        c.read<MainState>().setState(
              id: PagesShowState.exitososhow,
              texto: true,
              showState: true,
            );
        break;
      case 400:
        showMensaje("Error de Conetion", false);
        break;
      default:
    }
  }

  clickSomosEmpresas(BuildContext context) {
    context.read<MainState>().setState(
          id: PagesShowState.naturalshow,
          texto: false,
        );
    context.read<MainState>().setState(
          id: PagesShowState.legal1show,
          texto: true,
          showState: true,
        );
  }

  clickRegistroEmpresas(BuildContext c) async {
    String nombresText = c.read<MainState>().getState(TxtState.nombresRegE);
    String apellidosText = c.read<MainState>().getState(TxtState.apellidoRegE);
    String emailText = c.read<MainState>().getState(TxtState.emailRegE);
    String phoneText = c.read<MainState>().getState(TxtState.phoneIndRegE);

    final bool isMovilColombia = phoneText.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);

    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValidEmail = emailRegEx.hasMatch(emailText);

    if (nombresText.length < 3) {
      showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!isValidEmail) {
      showMensaje("Ingresa un Email válido");
      return;
    }

    if (!isMovilColombia) {
      showMensaje("Ingrese un número celular válido");
      return;
    }

    //TODO_Realizar Un unico metodo con Personas
    Map<String, dynamic> empresa = {
      'id': "automatico",
      'idUser': "automatico",
      'name': nombresText,
      'lastname': apellidosText,
      'email': emailText,
      'phone': phoneText,
      'identityNumber': null,
      'sex': null,
      'birthDay': null,
      'points': 0,
      'subscriptionProfile': 0,
      'isCompany': true,
      'deviceToken': null,
    };

    Map<String, dynamic>? result = await EndPointApi().addUsers(user: empresa);
    switch (result['statusCode']) {
      case 200:
        showMensaje(
            "Representante L. Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
            false);
        break;
      case 400:
        showMensaje("Error de Conetion", false);
        break;
      default:
    }

    c.read<MainState>().setState(
          id: PagesShowState.legal2show,
          texto: true,
          showState: true,
        );
  }

  clickRegistroEmpresas2(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.exitososhow,
          texto: true,
          showState: true,
        );
  }

  clickRegistroOTP(BuildContext context) {
    context.read<MainState>().setState(
          id: PagesShowState.otpshow,
          texto: true,
          showState: true,
        );
  }

  clickOTPResend(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.reotpshow,
          texto: true,
          showState: true,
        );
  }

  resetPop(BuildContext context) {
    MainState modelo = context.read<MainState>();
    modelo
      ..setState(id: PagesShowState.singinshow, texto: false)
      ..setState(id: PagesShowState.cityshow, texto: false)
      ..setState(id: PagesShowState.tamanoshow, texto: false)
      ..setState(id: PagesShowState.asegurashow, texto: false)
      ..setState(id: PagesShowState.naturalshow, texto: false)
      ..setState(id: PagesShowState.legal1show, texto: false)
      ..setState(id: PagesShowState.legal2show, texto: false)
      ..setState(id: PagesShowState.exitososhow, texto: false)
      ..setState(id: PagesShowState.otpshow, texto: false)
      ..setState(id: PagesShowState.reotpshow, texto: false);
  }
}

void showMensaje(String mensaje, [bool error = true]) {
  Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Color(error ? 0xB2FF0000 : 0x9D22B573),
      textColor: Colors.white,
      fontSize: 20.0);
}
