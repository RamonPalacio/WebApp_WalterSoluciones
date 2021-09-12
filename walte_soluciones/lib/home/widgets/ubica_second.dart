import 'package:flutter/material.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/custom/molecules/TextboxW.dart';
import 'package:walte_soluciones/home/widgets/ubica_inicial.dart';

class SecondLocation extends StatelessWidget {
  const SecondLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      // height: 168,
      width: double.infinity,
      // color: const Color(0xFFFFFFFF),
      decoration: boxDecoration,
      child: Column(
        children: const [
          OptionB(),
          SizedBox(height: 10),
          TextBoxW(
            iconPre: Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
              child: Img(color: 0xFF002EA8, size: 1),
            ),
            texto: "Entregar documentos",
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            iconPos: Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 18, top: 18, bottom: 18),
              child: ImgCheck(color: 0xFF002EA8, size: 1),
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
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFED6C1D),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: const Text("B",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: TextBoxW(
              iconPre: Padding(
                padding:
                    EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
                child: Img(color: 0xFF002EA8, size: 1),
              ),
              texto: "Carrera 66 # 48 - 63",
              textoBase: "Ingresar dirección o sitio",
              iconPos: Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 18, top: 18, bottom: 18),
                child: ImgCheck(color: 0xFF002EA8, size: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
