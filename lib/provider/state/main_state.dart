import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:walte_soluciones/provider/state/const_pages_show_state.dart';
import 'package:walte_soluciones/provider/state/const_state.dart';
export 'package:provider/src/provider.dart';
import 'package:latlong2/latlong.dart';
export 'package:latlong2/latlong.dart';

class MainState extends ChangeNotifier {
  MapController _mapControler = MapController();
  final Map<dynamic, dynamic> _inputTextState = {
    //Buscadores de Direcciones
    ConstState.dirListPredictionA: [],
    ConstState.dirListPredictionB: [],
    // "DateBoxfinzi_RegistroPage": "2021-08-01"

    PagesShowState.cityshow: true,
    PagesShowState.tamanoshow: false,
    PagesShowState.singinshow: false,
    PagesShowState.declaredhow: false,
    PagesShowState.naturalshow: false,
    PagesShowState.legal1show: false,
    PagesShowState.legal2show: false,
    PagesShowState.exitososhow: false,
    PagesShowState.otpshow: false,
    PagesShowState.reotpshow: false,
    PagesShowState.isloadinglogin: false,
    PagesShowState.idayvueltamenu: false,

    ConstState.updateFlutterMap: true,
    ConstState.isLoading: false,
    ConstState.isLoadingReg: false,
    ConstState.autoidFirebase: "",
    ConstState.btnidayvuelta: false,
    ConstState.textoBtnciudad: "Medellín",
    ConstState.textoBtnTamano: "Pequeños",

    ConstState.valueDeclarate: 250,

    ConstState.centerMap: LatLng(6.246727, -75.566189), //Medellin
    ConstState.markerA: LatLng(0, 0),
    ConstState.markerB: LatLng(0, 0)
  };

  void removeState(
    iD, {
    showState = false,
  }) {
    _inputTextState.remove(iD);
    if (showState = true) notifyListeners();
  }

  getState(iD) => _inputTextState["$iD"] ?? "";

  void setState({
    required String id,
    required dynamic texto,
    bool updateGeneralState = false,
  }) {
    if (texto != null) _inputTextState[id] = texto;
    if (updateGeneralState) notifyListeners();
  }

  getControlador(nameControler) {
    switch (nameControler) {
      case ConstState.mapController:
        return _mapControler;
    }
  }

  setControlador(MapController controller) {
    _mapControler = controller;
  }
}
