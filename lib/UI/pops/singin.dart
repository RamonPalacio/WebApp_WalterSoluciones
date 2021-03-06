import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/state/const_state.dart';
import 'package:walte_soluciones/database/constant/const_styles.dart';
import 'package:walte_soluciones/provider/state/const_txt_state_name.dart';
import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';

import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class SingIn extends StatelessWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
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
              'Inicia sesión',
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
            TextBoxSubtitle(
              keyboardType: TextInputType.number,
              texto: "",
              textoBase: "Celular registrado en Walter",
              containerWidth: 400,
              maxlength: 10,
              formateado: [
                FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'),
                ),
              ],
              iconPre: SvgPicture.asset(
                "assets/icons/phone.svg",
                height: 16,
                fit: BoxFit.fitHeight,
              ),
              iconPos: SvgPicture.asset(
                "assets/icons/next.svg",
                height: 16,
                fit: BoxFit.fitHeight,
              ),
              onChanged: (text) {
                context.read<MainState>().setState(
                    id: TxtStateName.phoneSignin,
                    texto: text,
                    updateGeneralState: true);
              },
            ),
            const SizedBox(height: 16),
            Selector<MainState, bool>(
              selector: (c, find) {
                return find.getState(ConstState.isLoading);
              },
              builder: (BuildContext c, bool isLoading, _) {
                if (!isLoading) {
                  return BotonGradiane(
                    fontsize: 5,
                    text: "Continuar",
                    onPressed: () {
                      context.read<MainBLoC>().clickLogIn(context);
                    },
                    height: 35,
                    width: 200,
                    colorUp: 0xFF002EA8,
                    colorDown: 0xFF002EA8,
                    border: 10,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 16),
            BotonGradiane(
              text: "¿No estás registrado?",
              fontsize: 5,
              border: 10,
              onPressed: () {
                context.read<MainBLoC>().showPopUpRegPersonas(context);
              },
              height: 35,
              width: 200,
              colorUp: 0xFFFFFFFF,
              colorDown: 0xFFFFFFFF,
              colortext: const Color(0xFF002EA8),
              alingText: Alignment.center,
              borderColor: 0xFFF3F3F5,
            )
          ],
        ),
      ),
    );
  }
}
