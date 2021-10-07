import 'package:flutter/material.dart';
import 'package:walte_soluciones/app/app_poppages.dart';
import 'package:walte_soluciones/app/app_state.dart';

class MainState extends ChangeNotifier {
  final Map<dynamic, dynamic> _inputTextState = {
    // "DateBoxfinzi_RegistroPage": "2021-08-01"
    PagesShowState.cityshow: false,
    PagesShowState.tamanoshow: false,
    PagesShowState.singinshow: false,
    PagesShowState.asegurashow: false,
    PagesShowState.naturalshow: false,
    PagesShowState.legal1show: false,
    PagesShowState.legal2show: false,
    PagesShowState.exitososhow: false,
    PagesShowState.otpshow: false,
    PagesShowState.reotpshow: false,
    PagesShowState.isloadinglogin: false,
    PagesShowState.idayvueltamenu: false,

    AppState.btnidayvuelta: false,
    AppState.isLoading: false,
    AppState.autoidFirebase: "",
    AppState.btnciudad: "Medellin",
    AppState.btntamano: "Pequeños",
  };

  void removeState(
    iD, {
    showState = false,
  }) {
    // ignore: avoid_print
    print("MainState>removeState:" + iD);
    _inputTextState.remove(iD);
    if (showState = true) notifyListeners();
  }

  getState(iD) {
    // ignore: avoid_print
    print("MainState>getState" + iD);
    return _inputTextState["$iD"] ?? "";
  }

  setState({
    required id,
    required texto,
    showState = false,
  }) {
    // ignore: avoid_print
    print(
      "MainState>setState=> id:${id.toString()} texto: ${texto.toString()}",
    );

    if (texto != null) {
      _inputTextState[id] = texto;
    }
    if (showState = true) notifyListeners();
  }
}
