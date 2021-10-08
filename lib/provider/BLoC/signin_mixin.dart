import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/app_poppages.dart';
import 'package:walte_soluciones/constant/states_fields.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';

import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/data/models/sms_check.dart';
import 'package:walte_soluciones/data/models/sms_send.dart';
import 'package:walte_soluciones/data/models/user.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/BLoC/verifications.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

abstract class SignInBloc {
  void clickLogIn(BuildContext c) async {
    MainState mainState = c.read<MainState>();
    String celularText = mainState.getState(TxtStateName.phoneSignin);

    mainState.setState(
      id: ConstState.isLoading,
      texto: true,
      updateGeneralState: true,
    );

    if (!Verifications().verificarCelular(celularText)) {
      // showMensaje("Ingrese un número celular válido");

      mainState.setState(
        id: ConstState.isLoading,
        texto: false,
        updateGeneralState: true,
      );

      return;
    }

    if (await Verifications().celularExisteFirebase(celularText)) {
      // showMensaje("Ingrese Un Número Celular Válido");

      mainState.setState(
        id: ConstState.isLoading,
        texto: false,
        updateGeneralState: true,
      );

      return;
    }

    SMS usuario = await EndPointApi().sendSMS(celularText);
    if (usuario.successful) {
      c.read<MainBLoC>().resetPop(c);

      mainState.setState(
        id: PagesShowState.otpshow,
        texto: true,
        updateGeneralState: true,
      );
    }

    mainState.setState(
      id: ConstState.isLoading,
      texto: false,
      updateGeneralState: true,
    );
  }

  void endInputPincode(BuildContext c, String pinCode) async {
    MainState cState = c.read<MainState>();
    String celularText = cState.getState(TxtStateName.phoneSignin);

    SmsCheck smscheck = await EndPointApi().checkSMS(
        cState.getState(TxtStateName.phoneSignin), int.parse(pinCode));
    if (smscheck.successful) {
      User userClient = await EndPointApi().getUserFirebase(celularText);
      cState
        ..setState(
          id: ConstState.userPhone,
          texto: userClient.phone,
        )
        ..setState(
            id: ConstState.userName,
            texto: '${userClient.name} ${userClient.lastname}')
        ..setState(
          id: ConstState.userEmail,
          texto: userClient.name,
        )
        ..setState(
          id: ConstState.userAutoId,
          texto: userClient.autoId,
          updateGeneralState: true,
        );
    } else {
      // showMensaje("Validacion No exitosa", false);
    }
    c.read<MainBLoC>().resetPop(c);
  }

  void clickLogOut(BuildContext context) {
    context.read<MainState>()
      ..removeState(ConstState.userAutoId)
      ..removeState(ConstState.userPhone)
      ..removeState(ConstState.userName)
      ..removeState(ConstState.userEmail);
  }
}
