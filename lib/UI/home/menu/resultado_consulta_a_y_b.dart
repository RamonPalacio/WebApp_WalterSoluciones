import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

class ResultadoDirecciones extends StatelessWidget {
  const ResultadoDirecciones({
    Key? key,
    required this.txtStateName,
    required this.dirListPrediction,
    required this.marker,
  }) : super(key: key);

  final String txtStateName;
  final String dirListPrediction;
  final String marker;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(
      builder: (c, mainState, _) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Container(
            // margin: const EdgeInsets.only(left: 6, right: 6),
            color: const Color(0xFFF1F1F1),
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: (mainState.getState(dirListPrediction) as List).length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      String direccion = mainState
                          .getState(dirListPrediction)[index][0]
                          .toString();
                      double lat =
                          mainState.getState(dirListPrediction)[index][1];
                      double lng =
                          mainState.getState(dirListPrediction)[index][2];

                      // mainState.setState(id:)
                      Logger().w('$direccion $lat $lng');
                      //TODO_ Controlador de Text desde arriba pero a su ves desde State

                      context
                          .read<TxtControllersState>()
                          .getControladorTxt(txtStateName)
                          .text = direccion;
                      (context
                                  .read<MainState>()
                                  .getControlador(ConstState.mapController)
                              as MapController)
                          .move(LatLng(lat, lng), 18);

                      context.read<MainState>().setState(
                            id: marker,
                            texto: LatLng(lat, lng),
                            updateGeneralState: true,
                          );

                      mainState.setState(
                          id: dirListPrediction,
                          texto: [],
                          updateGeneralState: true);
                    },
                    child: Card(
                      child: Text(mainState
                          .getState(dirListPrediction)[index][0]
                          .toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
