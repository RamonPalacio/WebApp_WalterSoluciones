import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/app_poppages.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'main_provider_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

abstract class RegisrtoBloc {
  clickPersonas(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.naturalshow,
          texto: true,
        );
  }

  clickRegistroPersonas(BuildContext c) async {
    String nombresText = c.read<MainState>().getState(TxtStateName.nombresReg);
    String apellidosText =
        c.read<MainState>().getState(TxtStateName.apellidoReg);
    String emailText = c.read<MainState>().getState(TxtStateName.emailReg);
    String phoneText = c.read<MainState>().getState(TxtStateName.phoneReg);

    final bool isMovilColombia = phoneText.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);

    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValidEmail = emailRegEx.hasMatch(emailText);

    if (nombresText.length < 3) {
      // showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      // showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!isValidEmail) {
      // showMensaje("Ingresa un Email válido");
      return;
    }

    if (!isMovilColombia) {
      // showMensaje("Ingrese un número celular válido");
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

    Map<String, dynamic> responseFirebase =
        await EndPointApi().getUsers(phoneText);

    if (responseFirebase['phone'].runtimeType != String) {
      // showMensaje("Ingrese Un Número Celular Válido");
      return;
    }
    Map<String, dynamic>? result = await EndPointApi().addUsers(user: user);
    switch (result['statusCode']) {
      case 200:
        // showMensaje(
        //     "Usuario Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
        //     false);
        c.read<MainBLoC>().resetPop(c);
        c.read<MainState>().setState(
              id: PagesShowState.exitososhow,
              texto: true,
              updateGeneralState: true,
            );
        break;
      case 400:
        // showMensaje("Error de Conetion", false);
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
          updateGeneralState: true,
        );
  }

  clickRegistroEmpresas(BuildContext c) async {
    String nombresText = c.read<MainState>().getState(TxtStateName.nombresRegE);
    String apellidosText =
        c.read<MainState>().getState(TxtStateName.apellidoRegE);
    String emailText = c.read<MainState>().getState(TxtStateName.emailRegE);
    String phoneText = c.read<MainState>().getState(TxtStateName.phoneIndRegE);

    final bool isMovilColombia = phoneText.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);

    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValidEmail = emailRegEx.hasMatch(emailText);

    if (nombresText.length < 3) {
      // showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      // showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!isValidEmail) {
      // showMensaje("Ingresa un Email válido");
      return;
    }

    if (!isMovilColombia) {
      // showMensaje("Ingrese un número celular válido");
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
        // showMensaje(
        //     "Representante L. Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
        //     false);
        break;
      case 400:
        // showMensaje("Error de Conetion", false);
        break;
      default:
    }

    c.read<MainState>().setState(
          id: PagesShowState.legal2show,
          texto: true,
          updateGeneralState: true,
        );
  }

  clickRegistroEmpresas2(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.exitososhow,
          texto: true,
          updateGeneralState: true,
        );
  }
}
