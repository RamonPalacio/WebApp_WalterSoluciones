import 'package:flutter/material.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/custom/molecules/TextboxW.dart';

var boxDecoration = BoxDecoration(
  color: const Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(30),
  boxShadow: const <BoxShadow>[
    BoxShadow(
        color: Color(0x52474747), blurRadius: 24.0, offset: Offset(0.0, 12.0))
  ],
);

class InitialLocation extends StatelessWidget {
  const InitialLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      // height: 232,
      // width: double.infinity,
      // color: const Color(0xFFFFFFFF),
      decoration: boxDecoration,
      child: Column(
        children: const [
          OptionA(),
          SizedBox(height: 10),
          TextBoxW(
            iconPre: Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
              child: Img(color: 0xFF002EA8, size: 1),
            ),
            textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
            texto: "Recoger sobre con documentos",
            iconPos: Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 18, top: 18, bottom: 18),
              child: ImgCheck(color: 0xFF002EA8, size: 1),
            ),
          ),
          SizedBox(height: 10),
          TextBoxW(
            iconPre: Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
              child: Img(color: 0xFF002EA8, size: 1),
            ),
            textoBase: "Celular de Contacto",
            texto: "300 562 3030",
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
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            color: Color(0xFF002EA8),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: const Text("A",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: InkWell(
              onTap: () {
                print("hola1");
              },
              child: const TextBoxW(
                iconPre: Padding(
                  padding:
                      EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
                  child: Img(color: 0xFF002EA8, size: 1),
                ),
                textoBase: "Ingresar dirección o sitio",
                texto: "Calle 49 # 30 - 15",
                iconPos: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 18, top: 18, bottom: 18),
                  child: ImgCheck(color: 0xFF002EA8, size: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
