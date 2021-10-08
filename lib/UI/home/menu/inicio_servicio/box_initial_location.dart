import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/opcion_a.dart';
import 'package:walte_soluciones/UI/home/menu/inicio_servicio/resultado_consulta.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

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
          const ResultadoDirecciones(),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            // texto: null,
            controller: TextEditingController(),
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: const Padding(
              padding: EdgeInsets.only(left: 0, right: 6),
              child: Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            iconPos: const Padding(
              padding: EdgeInsets.only(left: 6, right: 0),
              child: ImgCheck(color: 0xFF353B4D, size: 1),
            ),
          ),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            enable: true,
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
