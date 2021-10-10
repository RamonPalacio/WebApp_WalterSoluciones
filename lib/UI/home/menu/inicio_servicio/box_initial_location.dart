import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/opcion_a.dart';
import 'package:walte_soluciones/UI/home/menu/resultados_direcciones/resultado_consulta_a_y_b.dart';
import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/context/constant/const_styles.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';
import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';

class InitialLocation extends StatelessWidget {
  const InitialLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController txtControllersState =
    //     TextEditingController(text: 'hola');
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: boxDecoration,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: OptionA(),
          ),
          const ResultadoDirecciones(
            txtStateName: TxtStateName.txtDirprincipal,
            dirListPrediction: ConstState.dirListPredictionA,
            marker: ConstState.markerA,
          ),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            iconPre: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
              child: SvgPicture.asset(
                "assets/icons/infoicon.svg",
                color: const Color(0xFF353B4D),
                height: 16,
                fit: BoxFit.fitHeight,
              ),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            iconPos: Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: SvgPicture.asset(
                "assets/icons/check.svg",
                color: const Color(0xFF353B4D),
                height: 16,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            iconPre: SvgPicture.asset("assets/icons/phone.svg",
                color: const Color(0xFF353B4D)),
            textoBase: "Celular de Contacto",
            texto: "",
          ),
        ],
      ),
    );
  }
}
