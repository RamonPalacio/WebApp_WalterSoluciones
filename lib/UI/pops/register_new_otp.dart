import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/app/app_textboxs.dart';
import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';

import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';
import 'package:walte_soluciones/provider/States/mainstate.dart';

class RegisterNewOtp extends StatelessWidget {
  const RegisterNewOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 650,
      // color: const Color(0xFD000000),
      decoration: boxDecoration,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Image.asset('assets/icons/loginHeader.png'),
            const SizedBox(height: 20),
            Text(
              '¿No recibiste el código?',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xFD002EA8),
              ),
            ),
            const SizedBox(height: 16),
            BotonGradiane(
              fontsize: 5,
              iconPre: SvgPicture.asset("assets/icons/sendmini.svg"),
              colortext: const Color(0xFF002EA8),
              padingLeft: 0,
              padingRight: 5,
              onPressed: () {
                context.read<MainBLoC>().clickLogIn(context);
              },
              height: 50,
              width: 300,
              colorUp: 0xFF002EA8,
              colorDown: 0xFF002EA8,
              border: 15,
              borderColor: 0xFF002EA8,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                // width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFFFFFF),
                ),
                child: FittedBox(
                  child: Text(
                    "Reenviar SMS a +57 ${context.read<MainState>().getState(TxtState.phoneSignin)}",
                    style: const TextStyle(
                      color: Color(0xFF002EA8),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}