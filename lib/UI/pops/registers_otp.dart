import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';

import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';

import 'package:walte_soluciones/UI/home/menu/inicio_servicio/box_initial_location.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/context/main_state.dart';

class RegisterOtp extends StatelessWidget {
  const RegisterOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
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
              'Ingresa el código',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xFD002EA8),
              ),
            ),
            Text(
              'Lo enviamos al +57 ' +
                  context.read<MainState>().getState(TxtStateName.phoneSignin),
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFD353B4D),
              ),
            ),
            const SizedBox(height: 20),
            PinCodeTextField(
              autofocus: true,
              // controller: controlador,
              // hideCharacter: true,
              highlight: true,
              highlightColor: Colors.blue,
              defaultBorderColor: Colors.black,
              hasTextBorderColor: Colors.green,
              maxLength: 6,
              // hasError: hasError,
              // maskCharacter: "*",
              // onTextChanged: (text) {
              //   setState(() {
              //     hasError = false;
              //   });
              // },
              onDone: (otpCode) {
                context.read<MainBLoC>().endInputPincode(context, otpCode);
              },
              pinBoxWidth: 50,
              pinBoxHeight: 64,
              // hasUnderline: true,
              wrapAlignment: WrapAlignment.spaceAround,
              pinBoxDecoration:
                  ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
              pinTextStyle: const TextStyle(fontSize: 22.0),
              pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
              pinTextAnimatedSwitcherDuration:
                  const Duration(milliseconds: 300),
//                    highlightAnimation: true,
              highlightAnimationBeginColor: Colors.black,
              highlightAnimationEndColor: Colors.white12,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            BotonGradiane(
              text: "No recibí el código",
              fontsize: 5,
              border: 10,
              // padingLeft: 0,
              // padingRight: 0,
              onPressed: () {
                context.read<MainBLoC>().clickOTPResend(context);
              },
              height: 35,
              width: 200,
              colorUp: 0xFFFFFFFF,
              colorDown: 0xFFFFFFFF,
              colortext: const Color(0xFF002EA8),
              alingText: Alignment.center,
              borderColor: 0xFFF3F3F5,
            ),
          ],
        ),
      ),
    );
  }
}
