import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';

import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 700,
        width: 650,
        // color: const Color(0xFD000000),
        decoration: boxDecoration,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Image.asset('assets/main.png'),
              const SizedBox(height: 20),
              Text(
                'Ingresa la ciudad\ndonde te encuentras',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD002EA8),
                ),
              ),
              Text(
                'Para solicitar tu servicio',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD353B4D),
                ),
              ),
              const SizedBox(height: 20),
              BotonGradiane(
                text: "Medellín",
                colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 280,
                onPressed: () {
                  context.read<MainBLoC>().clickCity(context, city: "Medellín");
                },
                height: 56,
                width: 450,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/location_gris.png",
                  fit: BoxFit.fitHeight,
                  height: 20,
                  width: 20,
                ),
                iconPos: Image.asset(
                  "assets/icons/icon_incity_next.png",
                  fit: BoxFit.fitHeight,
                  height: 15,
                  width: 20,
                ),
                border: 10,
              ),
              const SizedBox(height: 20),
              BotonGradiane(
                text: "Bogotá",
                colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 290,
                onPressed: () {
                  context.read<MainBLoC>().clickCity(context, city: "Bogotá");
                },
                height: 56,
                width: 450,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/location_gris.png",
                  fit: BoxFit.fitHeight,
                  height: 20,
                  width: 20,
                ),
                iconPos: Image.asset(
                  "assets/icons/icon_incity_next.png",
                  fit: BoxFit.fitHeight,
                  height: 15,
                  width: 20,
                ),
                border: 10,
              ),
              const SizedBox(height: 20),
              BotonGradiane(
                text: "Ciudad de Mexico",
                colortext: const Color(0xFD353B4D),
                padingLeft: 20,
                padingRight: 210,
                onPressed: () {
                  context
                      .read<MainBLoC>()
                      .clickCity(context, city: "Ciudad de Mexico");
                },
                height: 56,
                width: 450,
                colorUp: 0xFDEEEEEE,
                colorDown: 0xFDEEEEEE,
                iconPre: Image.asset(
                  "assets/icons/location_gris.png",
                  fit: BoxFit.fitHeight,
                  height: 20,
                  width: 20,
                ),
                iconPos: Image.asset(
                  "assets/icons/icon_incity_next.png",
                  fit: BoxFit.fitHeight,
                  height: 15,
                  width: 20,
                ),
                border: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
