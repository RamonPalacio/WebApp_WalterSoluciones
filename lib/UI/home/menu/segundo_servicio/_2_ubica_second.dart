import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walte_soluciones/UI/home/menu/resultados_direcciones/resultado_consulta_a_y_b.dart';
import 'package:walte_soluciones/UI/home/menu/segundo_servicio/opcion_b.dart';
import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';
import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';

class SecondLocation extends StatelessWidget {
  const SecondLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // height: 168,
      width: double.infinity,
      // color: const Color(0xFFFFFFFF),
      decoration: boxDecoration,
      child: Column(
        children: [
          const OptionB(),
          const ResultadoDirecciones(
            txtStateName: TxtStateName.txtDirsecundario,
            dirListPrediction: ConstState.dirListPredictionB,
            marker: ConstState.markerB,
          ),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            maxlength: 100,
            containerWidth: double.infinity,
            iconPre: Padding(
              padding: const EdgeInsets.only(left: 0, right: 6),
              child: SvgPicture.asset(
                "assets/icons/infoicon.svg",
                color: const Color(0xFF353B4D),
                height: 16,
                fit: BoxFit.fitHeight,
              ),

              // Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            iconPos: Padding(
              padding: const EdgeInsets.only(left: 6, right: 0),
              child: SvgPicture.asset(
                "assets/icons/check.svg",
                color: const Color(0xFF353B4D),
                height: 16,
                fit: BoxFit.fitHeight,
              ),

              //  ImgCheck(color: 0xFF353B4D, size: 1),
            ),
          ),
        ],
      ),
    );
  }
}
