import 'package:flutter/material.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
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
          SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: EdgeInsets.only(left: 0, right: 6),
              child: Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            texto: "Entregar documentos",
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

class OptionB extends StatelessWidget {
  const OptionB({
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
            color: Color(0xFFED6C1D),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: const Text("B",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: EdgeInsets.only(left: 0, right: 6),
              child: Img(color: 0xFF353B4D, size: 1),
            ),
            textoBase: "Ingresar dirección o sitio",
            texto: "Carrera 66 # 48 - 63",
            iconPos: Padding(
              padding: EdgeInsets.only(left: 6, right: 0),
              child: ImgCheck(color: 0xFF353B4D, size: 1),
            ),
          ),
        ),
      ],
    );
  }
}
