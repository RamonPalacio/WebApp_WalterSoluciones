import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';
import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';

class SelectTamano extends StatelessWidget {
  const SelectTamano({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 400,
        width: 650,
        // color: const Color(0xFD000000),
        decoration: boxDecoration,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
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
              BotonGradiane(
                // text: "Ciudad de Mexico",
                // colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 20,
                onPressed: () {
                  context
                      .read<MainBLoC>()
                      .clickTamano(context, tamano: "Pequeno");
                },
                height: 56,
                width: 400,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/icon_email.png",
                  fit: BoxFit.fill,
                  height: 15,
                  width: 15,
                ),
                iconPos: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFDDADADA),
                    shape: BoxShape.circle,
                  ),
                ),
                border: 10,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Pequeño / Sobre",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFD353B4D)),
                        ),
                        Text(
                          "Cabe en un morral / mochila",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFD353B4D)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              BotonGradiane(
                // text: "Ciudad de Mexico",
                // colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 20,
                onPressed: () {
                  context
                      .read<MainBLoC>()
                      .clickTamano(context, tamano: "Mediano");
                },
                height: 56,
                width: 400,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/icon_email.png",
                  fit: BoxFit.fill,
                  height: 15,
                  width: 15,
                ),
                iconPos: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFDDADADA),
                    shape: BoxShape.circle,
                  ),
                ),
                border: 10,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mediano / Grande",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFD353B4D)),
                        ),
                        Text(
                          "Cabe en maleta de mensajería",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFD353B4D)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              BotonGradiane(
                // text: "Ciudad de Mexico",
                // colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 20,
                onPressed: () {
                  context
                      .read<MainBLoC>()
                      .clickTamano(context, tamano: "Extra Grande");
                },
                height: 56,
                width: 400,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/icon_email.png",
                  fit: BoxFit.fill,
                  height: 15,
                  width: 15,
                ),
                iconPos: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFDDADADA),
                    shape: BoxShape.circle,
                  ),
                ),
                border: 10,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jumbo / Extra Grande",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFD353B4D)),
                        ),
                        Text(
                          "Cabe en moto con parrilla o carro",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFD353B4D)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
