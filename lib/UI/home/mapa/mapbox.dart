import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:walte_soluciones/core/constant/const_maps.dart';
import 'package:walte_soluciones/UI/home/mapa/extra/home_map_opensourse.dart';

class MapBox extends StatelessWidget {
  const MapBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 60.0, right: 60),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),

        ///MapaOpenSource Se puede Cambiar Rapidamente por OpenMap o MapBox
        child:
            //  Consumer<MainState>(
            //   builder: (_, mS, __) {
            //     return Visibility(
            //       visible: mS.getState(ConstState.updateFlutterMap),

            // child:
            FadeIn(
          child: const MapaOpenSourse(
            urlTemplate: ConstsMap.urlMap,
            stylemap: ConstsMap.styleMap,
            apiKey: ConstsMap.apiKey,
            copyright: ConstsMap.copyright,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        // );
        // },
        // ),
      ),
    );
  }
}
