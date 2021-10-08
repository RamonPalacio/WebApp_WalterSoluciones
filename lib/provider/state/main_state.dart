import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/pages_show_state.dart';
import 'package:walte_soluciones/constant/states_fields.dart';
import 'package:latlong2/latlong.dart';

class MainState extends ChangeNotifier {
  final Map<dynamic, dynamic> _inputTextState = {
    ConstState.dirListPrediction: [],
    // "DateBoxfinzi_RegistroPage": "2021-08-01"
    PagesShowState.cityshow: true,
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

    ConstState.btnidayvuelta: false,
    ConstState.isLoading: false,
    ConstState.autoidFirebase: "",
    ConstState.btnciudad: "Medellín",
    ConstState.btntamano: "Pequeños",

    ConstState.centerMap: LatLng(6.246727, -75.566189), //Medellin
    // ConstState.centerMap: LatLng(4.689466, -74.068881), // Bogota
    // ConstState.centerMap: LatLng(19.466878, -99.103316), // Ciudad de México, CDMX, México
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
    required String id,
    required texto,
    bool updateGeneralState = false,
  }) {
    // ignore: avoid_print
    print(
      "MainState>setState=> id:${id.toString()} texto: ${texto.toString()}",
    );

    if (texto != null) {
      _inputTextState[id] = texto;
    }
    if (updateGeneralState) notifyListeners();
  }
}
