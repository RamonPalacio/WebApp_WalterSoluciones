import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: boxDecoration,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: OptionA(),
          ),
          const SizedBox(height: 10),
          const TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: EdgeInsets.only(left: 0, right: 6),
              child: Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            texto: "",
            iconPos: Padding(
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

class OptionA extends StatelessWidget {
  const OptionA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF002EA8),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: const Text("A",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: InkWell(
              onTap: () {},
              child: const TextBoxSubtitle(
                textFieldAltura: 30,
                enable: true,
                iconPre: Padding(
                  padding: EdgeInsets.only(left: 0, right: 6),
                  child: Img(color: 0xFF353B4D, size: 1),
                ),
                textoBase: "Ingresar dirección o sitio",
                texto: "Calle 49 # 30 - 15",
                iconPos: Padding(
                  padding: EdgeInsets.only(left: 6, right: 0),
                  child: ImgCheck(color: 0xFF353B4D, size: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
