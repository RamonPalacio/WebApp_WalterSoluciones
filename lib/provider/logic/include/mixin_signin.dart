import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/state/const_pages_show_state.dart';
import 'package:walte_soluciones/provider/state/const_state.dart';
import 'package:walte_soluciones/provider/state/const_txt_state_name.dart';

import 'package:walte_soluciones/database/endpoint_api.dart';
import 'package:walte_soluciones/models/model_sms_check.dart';
import 'package:walte_soluciones/models/model_sms_send.dart';
import 'package:walte_soluciones/models/model_user.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';

import 'package:walte_soluciones/provider/logic/extra/verifications.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

abstract class SignInBloc {
  void clickLogIn(BuildContext c) async {
    MainState mS = c.read<MainState>();
    String celularText = mS.getState(TxtStateName.phoneSignin);

    mS.setState(
      id: ConstState.isLoading,
      texto: true,
      updateGeneralState: true,
    );

    if (!Verifications().isValidMobil(celularText)) {
      c.read<MainBLoC>().showMensaje("Ingrese un número celular válido");
      mS.setState(
        id: ConstState.isLoading,
        texto: false,
        updateGeneralState: true,
      );

      return;
    }

    if (!await Verifications().mobilExistsInDatabase(celularText)) {
      c.read<MainBLoC>().showMensaje("Ingrese Un Número Celular Válido");

      mS.setState(
        id: ConstState.isLoading,
        texto: false,
        updateGeneralState: true,
      );

      return;
    }

    SMS usuario = await EndPointApi().sendSMS(celularText);
    if (usuario.successful) {
      c.read<MainBLoC>().resetPop(c);

      mS.setState(
        id: PagesShowState.otpshow,
        texto: true,
        updateGeneralState: true,
      );
    }

    mS.setState(
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
