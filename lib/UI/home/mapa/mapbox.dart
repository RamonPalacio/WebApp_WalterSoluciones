import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/constant/const_maps.dart';
import 'package:walte_soluciones/UI/home/mapa/mapwidget.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class MapBox extends StatelessWidget {
  const MapBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(builder: (c, modelState, _) {
      return Container(
        padding: const EdgeInsets.only(left: 20.0, bottom: 60.0, right: 60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: const MapaOpenSourse(
            urlTemplate: ConstsMap.urlMap,
            stylemap: ConstsMap.styleMap,
            apiKey: ConstsMap.apiKey,
            copyright: ConstsMap.copyright,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      );
    });
  }
}
