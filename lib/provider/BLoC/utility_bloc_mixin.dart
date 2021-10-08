import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:walte_soluciones/constant/app_poppages.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/constant/states_fields.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

abstract class Utility {
  void resetPop(BuildContext context) {
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

  void clickgetDir(BuildContext ctx, {String city = ""}) {
    ctx.read<MainState>().setState(
          id: ConstState.btnciudad,
          texto: city,
          updateGeneralState: true,
        );
  }

  void clickCity(BuildContext context, {String city = ""}) {
    if (city != "") {
      context.read<MainState>()
        ..setState(id: ConstState.btnciudad, texto: city)
        ..setState(
          id: PagesShowState.cityshow,
          texto: false,
          updateGeneralState: true,
        );
    } else {
      context.read<MainState>().setState(
            id: PagesShowState.cityshow,
            texto: true,
            updateGeneralState: true,
          );
    }
  }

  void clickTamano(BuildContext context, {String tamano = ""}) {
    if (tamano != "") {
      context.read<MainState>()
        ..setState(
          id: ConstState.btntamano,
          texto: tamano,
        )
        ..setState(
          id: PagesShowState.tamanoshow,
          texto: false,
          updateGeneralState: false,
        );
    } else {
      context.read<MainState>().setState(
            id: PagesShowState.tamanoshow,
            texto: true,
            updateGeneralState: false,
          );
    }
  }

  void clickbtnSignIn(BuildContext context, {String tamano = ""}) {
    MainState mainState = context.read<MainState>();
    bool isvisible = mainState.getState(PagesShowState.singinshow);
    mainState.setState(id: PagesShowState.singinshow, texto: !isvisible);
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
}
