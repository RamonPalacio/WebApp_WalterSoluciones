import 'package:flutter/material.dart';
import 'package:walte_soluciones/UI/home/menu/resultado_consulta_a_y_b.dart';
import 'package:walte_soluciones/UI/home/menu/segundo_servicio/opcion_b.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';

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
        children: const [
          OptionB(),
          ResultadoDirecciones(
            txtStateName: TxtStateName.txtDirsecundario,
            dirListPrediction: ConstState.dirListPredictionB,
            marker: ConstState.markerB,
          ),
          SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: EdgeInsets.only(left: 0, right: 6),
              child: Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            iconPos: Padding(
              padding: EdgeInsets.only(left: 6, right: 0),
              child: ImgCheck(color: 0xFF353B4D, size: 1),
            ),
          ),
        ],
      ),
    );
  }
}
