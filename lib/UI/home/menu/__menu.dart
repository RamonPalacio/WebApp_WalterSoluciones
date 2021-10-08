import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';
import 'package:walte_soluciones/UI/home/menu/_2_ubica_second.dart';
import 'package:walte_soluciones/UI/home/menu/_3_add_destiny.dart';
import 'package:walte_soluciones/UI/home/menu/_4.0_SelectService.dart';
import 'package:walte_soluciones/UI/home/menu/_5_shipping_properties.dart';
import 'package:walte_soluciones/UI/home/menu/_6_resume.dart';
import 'package:walte_soluciones/constant/const_state.dart';
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
              onPressed: () async {
                // context
                //     .read<TxtControllersState>()
                //     .getControladorTxt(TxtStateName.txtDirprincipal)
                //     .text = "hola";

                // var result = await EndPointApi().getpoints(
                //     "-74.79317", "10.94668", "-74.80148", "10.94366");

                // ignore: avoid_print
              },
              child: const Text("hola")),
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
              texto: context.watch<MainState>().getState(ConstState.btntamano)),
          const SizedBox(height: 16),
          const ResumenPedido(),
        ],
      ),
    );
  }
}
