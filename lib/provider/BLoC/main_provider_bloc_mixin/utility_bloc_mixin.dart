import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:walte_soluciones/constant/const_maps.dart';
import 'package:walte_soluciones/constant/pages_show_state.dart';

import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:latlong2/latlong.dart';

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
      ..setState(
        id: PagesShowState.reotpshow,
        texto: false,
        updateGeneralState: true,
      );
  }

  void clickgetDir(BuildContext ctx, {String city = ""}) {
    ctx.read<MainState>().setState(
          id: ConstState.btnciudad,
          texto: city,
          updateGeneralState: true,
        );
  }

  void clickCity(BuildContext context, {String city = ""}) {
    MainState mainstate = context.read<MainState>();
    LatLng ciudadActual = LatLng(0, 0);
    switch (city) {
      case 'Medellín':
        ciudadActual = ConstsMap.medellinLatLng;
        break;
      case 'Bogotá':
        ciudadActual = ConstsMap.bogotaLatLng;
        break;
      case 'Ciudad de Mexico':
        ciudadActual = ConstsMap.ciudadDeMexicoLatLng;
        break;
      default:
        mainstate.setState(
          id: PagesShowState.cityshow,
          texto: true,
          updateGeneralState: true,
        );
        return;
    }

    ///Mueve El Mapa
    (mainstate.getControlador(ConstState.mapController) as MapController)
        .move(ciudadActual, 15);
    //

    ///Almacena Nombre de Ciudad
    mainstate
      ..setState(id: ConstState.btnciudad, texto: city)

      ///Guarda en el centerMap_State la ultima ubicacion.
      ..setState(id: ConstState.centerMap, texto: ciudadActual)

      ///Oculta PopUp [Ciudades]
      ..setState(
        id: PagesShowState.cityshow,
        texto: false,
        updateGeneralState: true,
      );
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
    context.read<MainState>().setState(
          id: PagesShowState.singinshow,
          texto: true,
          updateGeneralState: true,
        );
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
