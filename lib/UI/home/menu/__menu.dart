import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';
import 'package:walte_soluciones/UI/home/menu/segundo_servicio/box_second_location.dart';
import 'package:walte_soluciones/UI/home/menu/extra/add_address_menu.dart';
import 'package:walte_soluciones/UI/home/menu/extra/service_select_type.dart';
import 'package:walte_soluciones/UI/home/menu/extra/propiedades_envio.dart';
import 'package:walte_soluciones/UI/home/menu/extra/service_resumen.dart';

import 'package:walte_soluciones/provider/state/const_state.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 40, right: 20, top: 0, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            child: const Text("hola"),
            onPressed: () async {
              context.read<MainState>().setState(
                  id: ConstState.markerA,
                  texto: LatLng(6.246727, -75.566189),
                  updateGeneralState: true);
              context
                  .read<MainState>()
                  .setState(id: ConstState.updateFlutterMap, texto: false);

              // context.read<MainBLoC>().updateMap(context);

              // context
              //     .read<TxtControllersState>()
              //     .getControladorTxt(TxtStateName.txtDirprincipal)
              //     .text = "hola";

              // var result = await EndPointApi().getpoints(
              //     "-74.79317", "10.94668", "-74.80148", "10.94366");

              // ignore: avoid_print
            },
          ),
          const SizedBox(height: 20),
          const InitialLocation(),
          const SizedBox(height: 10),
          const SecondLocation(),
          const SizedBox(height: 10),
          const AddDirection(),
          const SizedBox(height: 16),
          SelectTipoServicio(sc: ScrollController()),
          const SizedBox(height: 16),
          ShippingProperties(
              texto: context
                  .watch<MainState>()
                  .getState(ConstState.textoBtnTamano)),
          const SizedBox(height: 16),
          const ResumenPedido(),
        ],
      ),
    );
  }
}
