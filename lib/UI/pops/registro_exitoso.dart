import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/state/const_pages_show_state.dart';
import 'package:walte_soluciones/database/constant/const_styles.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class RegisterExitoso extends StatelessWidget {
  const RegisterExitoso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      context.read<MainBLoC>().resetPop(context);
      context.read<MainState>().setState(
            id: PagesShowState.singinshow,
            texto: true,
            updateGeneralState: true,
          );
    });
    return Container(
      height: 400,
      width: 650,
      // color: const Color(0xFD000000),
      decoration: boxDecoration,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Image.asset('assets/headerexitoso.png'),
            const SizedBox(height: 20),
            Text(
              'Te has registrado exitosamente',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xFD002EA8),
              ),
            ),
            Text(
              'Serás redireccionado al inicio',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFD353B4D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
