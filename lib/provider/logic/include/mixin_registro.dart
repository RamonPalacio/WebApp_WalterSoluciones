import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/context/constant/const_pages_show_state.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';
import 'package:walte_soluciones/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/logic/extra/verifications.dart';
import 'package:walte_soluciones/provider/context/main_state.dart';

abstract class RegisrtoBloc {
  void showPopUpRegPersonas(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.naturalshow,
          texto: true,
          updateGeneralState: true,
        );
  }

  ///Funcion que muestra el PopUp [SomosEmpresa]
  void showPopUpRegEmpresa(BuildContext context) {
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

  void addUsuario(BuildContext context, [bool personas = true]) async {
    MainBLoC mB = context.read<MainBLoC>();
    MainState mS = context.read<MainState>();
    String nombresText;
    String apellidosText;
    String emailText;
    String phoneText;

    mS.setState(
        id: ConstState.isLoadingReg, texto: true, updateGeneralState: true);

    nombresText = mS.getState(
      personas ? TxtStateName.nombresReg : TxtStateName.nombresRegE,
    );

    apellidosText = mS.getState(
      personas ? TxtStateName.apellidoReg : TxtStateName.apellidoRegE,
    );

    emailText = mS.getState(
      personas ? TxtStateName.emailReg : TxtStateName.emailRegE,
    );

    phoneText = mS.getState(
      personas ? TxtStateName.phoneReg : TxtStateName.phoneIndRegE,
    );

    //=Validaciones pre-registro-personas=
    String error = '';
    if (nombresText.length < 3) {
      error = "Ingresa un nombre válido";
    }

    if (apellidosText.length < 3) {
      error = "Ingresa un apellido válido";
    }

    if (!Verifications().isValidEmail(emailText)) {
      error = "Ingresa un Email válido";
    }

    if (!Verifications().isValidMobil(phoneText)) {
      error = "Ingrese un número celular válido";
    }

    if (await Verifications().mobilExistsInDatabase(phoneText)) {
      error = "Ingrese Un Número Celular Válido";
    }

    if (error.isNotEmpty) {
      mB.showMensaje(error);
      mS.setState(
          id: ConstState.isLoadingReg, texto: false, updateGeneralState: true);
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
      "isCompany": !personas,
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
        // mB.showMensaje(
        //     "Registrado\n$nombresText\n$apellidosText\n$emailText\n$phoneText",
        //     false);
        break;
      case 400:
        mB.showMensaje("Error Red", false);
        break;
      default:
        mB.showMensaje("Error addUsers", false);
    }

    mS.setState(
        id: ConstState.isLoadingReg, texto: false, updateGeneralState: true);
    if (personas) {
      showPopUpRegExitoso(context);
    } else {
      mS.setState(
        id: PagesShowState.legal2show,
        texto: true,
        updateGeneralState: true,
      );
    }
  }

  void showPopUpRegExitoso(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.exitososhow,
          texto: true,
          updateGeneralState: true,
        );
  }
}
