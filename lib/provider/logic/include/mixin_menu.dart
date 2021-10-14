import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:walte_soluciones/provider/state/const_state.dart';
import 'package:walte_soluciones/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

abstract class MenuBloc {
  ///Acutaliza TextBoxA y TextBoxB de Busquedas por direccion en el Menu.
  void updatetxtubication(BuildContext context, String dirListPrediction,
      int index, String txtStateName, String marker) {
    MainState mainState = context.read<MainState>();
    String direccion =
        mainState.getState(dirListPrediction)[index][0].toString();
    double lat = mainState.getState(dirListPrediction)[index][1];
    double lng = mainState.getState(dirListPrediction)[index][2];

    /// Asignar direccion al TextBox, de acuerdo a la direccion que fue Seleccionada en el desplegable
    context.read<TxtControllersState>().getControladorTxt(txtStateName).text =
        direccion;

    /// Centar mapa en la nueva direccion, de acuerdo a la que fue Seleccionada en el desplegable
    (context.read<MainState>().getControlador(ConstState.mapController)
            as MapController)
        .move(LatLng(lat, lng), 18);

    /// Actualizar ubicacion al marker, de acuerdo a la direccion que fue Seleccionada en el desplegable
    context.read<MainState>().setState(
          id: marker,
          texto: LatLng(lat, lng),
          updateGeneralState: true,
        );

    /// Eliminar lista de predicciones, para que oculte el desplegable de predicciones
    mainState.setState(
        id: dirListPrediction, texto: [], updateGeneralState: true);
  }

  /// Actualiza la lista de ubicaciones sugeridas [resultado_direcciones]
  Future<void> updateDirSugestion(BuildContext context, String texto,
      String dirListPrediction, String ciudad) async {
    if (texto.length > 3) {
      String city = context.read<MainState>().getState(ciudad);
      context.read<MainState>().setState(
            id: dirListPrediction,
            texto: await EndPointApi().getUbicacion("$texto, $city"),
            updateGeneralState: true,
          );
    } else {
      context.read<MainState>().setState(
          id: ConstState.dirListPredictionA,
          texto: [],
          updateGeneralState: true);
    }
  }
}
