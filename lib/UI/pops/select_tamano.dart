import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';
import 'package:walte_soluciones/database/constant/const_styles.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';

class SelectTamano extends StatelessWidget {
  const SelectTamano({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 350,
        width: 450,
        decoration: boxDecoration,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Text(
                'Tamaño del envio',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD002EA8),
                ),
              ),
              Text(
                'Máximo 50 x 50 x 50 cm\nPeso máximo 50 kg.',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD353B4D),
                ),
              ),
              const SizedBox(height: 20),
              const CardTamano(
                selector: "Pequeño",
                texto: "Pequeño / Sobre",
                subTexto: "Cabe en un morral / mochila",
              ),
              const SizedBox(height: 20),
              const CardTamano(
                selector: "Mediano",
                texto: "Mediano / Grande",
                subTexto: "Cabe en maleta de mensajería",
              ),
              const SizedBox(height: 20),
              const CardTamano(
                selector: "Extra Grande",
                texto: "Jumbo / Extra Grande",
                subTexto: "Cabe en moto con parrilla o carro",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTamano extends StatelessWidget {
  const CardTamano({
    Key? key,
    required this.selector,
    required this.texto,
    required this.subTexto,
  }) : super(key: key);
  final String selector;
  final String texto;
  final String subTexto;

  @override
  Widget build(BuildContext context) {
    void Function(BuildContext context, {required String tamano})
        onClickTamano = context.read<MainBLoC>().cambiarTamano;

    return BotonGradiane(
      padingLeft: 20,
      padingRight: 20,
      onPressed: () {
        onClickTamano(context, tamano: selector);
      },
      height: 56,
      width: 400,
      colorUp: 0xFDEEEEEE,
      colorDown: 0xFDEEEEEE,
      iconPre: Image.asset(
        "assets/icons/icon_email.png",
        fit: BoxFit.scaleDown,
        height: 20,
        width: 20,
      ),
      border: 10,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texto,
                style: const TextStyle(fontSize: 20, color: Color(0xFD353B4D)),
              ),
              Text(
                subTexto,
                style: const TextStyle(fontSize: 15, color: Color(0xFD353B4D)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
