import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:walte_soluciones/constant/pages_show_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/data/models/user.dart';
import 'package:walte_soluciones/provider/BLoC/utility_bloc_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/verifications.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'main_provider_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

abstract class RegisrtoBloc {
  ///Funcion que Muestra el PopUp [Registro de Personas].
  void clickPersonas(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.naturalshow,
          texto: true,
          updateGeneralState: true,
        );
  }

  ///Funcion que registra una persona a la Base de Datos.
  void clickRegistroPersonas(BuildContext c) async {
    MainState mainstate = c.read<MainState>();
    MainBLoC mainbloc = c.read<MainBLoC>();

    String nombresText = mainstate.getState(TxtStateName.nombresReg);
    String apellidosText = mainstate.getState(TxtStateName.apellidoReg);
    String emailText = mainstate.getState(TxtStateName.emailReg);
    String phoneText = mainstate.getState(TxtStateName.phoneReg);

    //=Validaciones pre-registro-personas=
    if (nombresText.length < 3) {
      mainbloc.showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      mainbloc.showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!Verifications().isValidEmail(emailText)) {
      mainbloc.showMensaje("Ingresa un Email válido");
      return;
    }

    if (!Verifications().isValidMobil(phoneText)) {
      mainbloc.showMensaje("Ingrese un número celular válido");
      return;
    }

    if (await Verifications().mobilExistsInDatabase(phoneText)) {
      c.read<MainBLoC>().showMensaje("Ingrese Un Número Celular Válido");
      return;
    }
    //=Fin de Validaciones=

    Map<String, dynamic> user = {
      "id": null,
      "idUser": null,
      "autoId": null,
      "name": nombresText,
      "lastname": apellidosText,
      "email": emailText,
      "phone": phoneText,
      "isCompany": false,
      "sex": null,
      "time": null,
      "points": null,
      "birthDay": null,
      "deviceToken": null,
      "paymentMethod": null,
      "identityNumber": null,
      "typeOfDocument": null,
      "subscriptionProfile": null,
    };

    Map<String, dynamic>? result = await EndPointApi().addUsers(user: user);
    switch (result['statusCode']) {
      case 200:
        mainbloc.showMensaje(
            "Usuario Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
            false);
        mainbloc.resetPop(c);
        mainstate.setState(
          id: PagesShowState.exitososhow,
          texto: true,
          updateGeneralState: true,
        );
        break;
      case 400:
        mainbloc.showMensaje("Error Red", false);
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
    MainBLoC mainbloc = c.read<MainBLoC>();
    MainState mainstate = c.read<MainState>();

    String nombresText = mainstate.getState(TxtStateName.nombresRegE);
    String apellidosText = mainstate.getState(TxtStateName.apellidoRegE);
    String emailText = mainstate.getState(TxtStateName.emailRegE);
    String phoneText = mainstate.getState(TxtStateName.phoneIndRegE);

    //=Validaciones pre-registro-personas=
    if (nombresText.length < 3) {
      mainbloc.showMensaje("Ingresa un nombre válido");
      return;
    }

    if (apellidosText.length < 3) {
      mainbloc.showMensaje("Ingresa un apellido válido");
      return;
    }

    if (!Verifications().isValidEmail(emailText)) {
      mainbloc.showMensaje("Ingresa un Email válido");
      return;
    }

    if (!Verifications().isValidMobil(phoneText)) {
      mainbloc.showMensaje("Ingrese un número celular válido");
      return;
    }

    if (await Verifications().mobilExistsInDatabase(phoneText)) {
      c.read<MainBLoC>().showMensaje("Ingrese Un Número Celular Válido");
      return;
    }
    //=Fin de Validaciones=

    Map<String, dynamic> representante = {
      "id": null,
      "idUser": null,
      "autoId": null,
      "name": nombresText,
      "lastname": apellidosText,
      "email": emailText,
      "phone": phoneText,
      "isCompany": true, // true
      "sex": null,
      "time": null,
      "points": null,
      "birthDay": null,
      "deviceToken": null,
      "paymentMethod": null,
      "identityNumber": null,
      "typeOfDocument": null,
      "subscriptionProfile": null,
    };

    Map<String, dynamic>? result =
        await EndPointApi().addUsers(user: representante);
    switch (result['statusCode']) {
      case 200:
        mainbloc.showMensaje(
            "Representante L. Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
            false);
        break;
      case 400:
        mainbloc.showMensaje("Error Red", false);
        break;
      default:
    }

    mainstate.setState(
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
