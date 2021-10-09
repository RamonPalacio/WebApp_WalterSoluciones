import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/opcion_a.dart';
import 'package:walte_soluciones/UI/home/menu/resultados_direcciones/resultado_consulta_a_y_b.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';

var boxDecoration = BoxDecoration(
  color: const Color(0xFDFFFFFF),
  borderRadius: BorderRadius.circular(15),
  boxShadow: const <BoxShadow>[
    BoxShadow(
        color: Color(0x52474747), blurRadius: 12.0, offset: Offset(0.0, 5.0))
  ],
);

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
