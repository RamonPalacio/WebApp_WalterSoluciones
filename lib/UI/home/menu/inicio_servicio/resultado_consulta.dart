import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

class ResultadoDirecciones extends StatelessWidget {
  const ResultadoDirecciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(
      builder: (c, mainState, _) {
        Logger().v("pinto");
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
              itemCount:
                  (mainState.getState(ConstState.dirListPrediction) as List)
                      .length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      String direccion = mainState
                          .getState(ConstState.dirListPrediction)[index][0]
                          .toString();
                      double lat = mainState
                          .getState(ConstState.dirListPrediction)[index][1];
                      double lng = mainState
                          .getState(ConstState.dirListPrediction)[index][2];

                      // mainState.setState(id:)
                      Logger().w('$direccion $lat $lng');
                      context
                          .read<TxtControllersState>()
                          .getControladorTxt(TxtStateName.txtDirprincipal)
                          .text = direccion;
                      (context
                                  .read<MainState>()
                                  .getControlador(ConstState.mapController)
                              as MapController)
                          .move(LatLng(lat, lng), 15);

                      context.read<MainState>().setState(
                            id: ConstState.markers,
                            texto: LatLng(lat, lng),
                            updateGeneralState: true,
                          );
                      //TODO mover marker al punto

                      mainState.setState(
                          id: ConstState.dirListPrediction,
                          texto: [],
                          updateGeneralState: true);
                    },
                    child: Card(
                      child: Text(mainState
                          .getState(ConstState.dirListPrediction)[index][0]
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
