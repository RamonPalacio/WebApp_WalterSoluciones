import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/app/app_state.dart';
import 'package:walte_soluciones/app/app_textboxs.dart';
import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';

import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';
import 'package:walte_soluciones/provider/States/mainstate.dart';

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
                    id: TxtState.phoneSignin, texto: text, showState: true);
              },
            ),
            const SizedBox(height: 16),
            Selector<MainState, bool>(
              selector: (c, find) {
                return find.getState(AppState.isLoading);
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
              // padingLeft: 0,
              // padingRight: 0,
              onPressed: () {
                context.read<MainBLoC>().clickPersonas(context);
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
