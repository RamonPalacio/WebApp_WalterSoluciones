import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
import 'package:walte_soluciones/UI/home/menu/_2_ubica_second.dart';
import 'package:walte_soluciones/UI/home/menu/_3_add_destiny.dart';
import 'package:walte_soluciones/UI/home/menu/_4.0_SelectService.dart';
import 'package:walte_soluciones/UI/home/menu/_5_shipping_properties.dart';
import 'package:walte_soluciones/UI/home/menu/_6_resume.dart';
import 'package:walte_soluciones/app/app_state.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';
import 'package:walte_soluciones/provider/States/mainstate.dart';

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
              texto: context.watch<MainState>().getState(AppState.btntamano)),
          const SizedBox(height: 16),
          const ResumenPedido(),
        ],
      ),
    );
  }
}
