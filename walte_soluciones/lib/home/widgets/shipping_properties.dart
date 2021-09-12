import 'package:flutter/material.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_money.dart';
import 'package:walte_soluciones/custom/atoms/img_packet.dart';
import 'package:walte_soluciones/custom/molecules/TextboxW.dart';
import 'package:walte_soluciones/home/widgets/ubica_inicial.dart';

class ShippingProperties extends StatelessWidget {
  const ShippingProperties({
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
          SizedBox(height: 10),
          TextBoxW(
            iconPre: Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
              child: ImgPacket(color: 0xFF002EA8, size: 1),
            ),
            textoBase: "Tamaño del envio",
            texto: "Pequeño",
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
              child: ImgMoney(color: 0xFF002EA8, size: 1),
            ),
            textoBase: "Asegura tu servicio",
            texto: "Asegurado por \$ 50.000",
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
