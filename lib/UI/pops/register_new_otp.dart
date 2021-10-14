import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/database/constant/const_styles.dart';
import 'package:walte_soluciones/provider/state/const_txt_state_name.dart';

import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class RegisterNewOtp extends StatelessWidget {
  const RegisterNewOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function clickReenviarSMS = context.read<MainBLoC>().clickLogIn;

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
              onPressed: clickReenviarSMS(context),
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
                    "Reenviar SMS a +57 ${context.read<MainState>().getState(TxtStateName.phoneSignin)}",
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
