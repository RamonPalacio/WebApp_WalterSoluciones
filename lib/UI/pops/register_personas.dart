import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';

import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';
import 'package:walte_soluciones/custom/molecules/text_by_height.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class RegisterPersonas extends StatelessWidget {
  const RegisterPersonas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      width: 850,
      // color: const Color(0xFD000000),
      decoration: boxDecoration,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, top: 30),
        child: Row(
          children: [
            Image.asset(
              'assets/regpersonas.png',
              height: 500,
              width: 380,
              fit: BoxFit.fitHeight,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 500,
              width: 440,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextByHeight(
                    'Regístrate ahora',
                    height: 44,
                    textAlign: TextAlign.left,
                    textstyle: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFD002EA8),
                    ),
                  ),
                  TextByHeight(
                    'Haz parte de Walter',
                    height: 25,
                    textAlign: TextAlign.left,
                    textstyle: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFD353B4D),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      BotonGradiane(
                        padingLeft: 10,
                        padingRight: 30,
                        onPressed: () {},
                        height: 37,
                        width: 192,
                        colorUp: 0xFFC1D2FF,
                        colorDown: 0xFFC1D2FF,
                        border: 14,
                        borderColor: 0xFFC1D2FF,
                        iconPre: SvgPicture.asset(
                          "assets/icons/checkFill.svg",
                          fit: BoxFit.fitHeight,
                          height: 20,
                          width: 20,
                        ),
                        child: TextByHeight(
                          'Persona Natural',
                          height: 25,
                          textstyle: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFD002EA8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      BotonGradiane(
                        padingLeft: 10,
                        padingRight: 30,
                        onPressed: () {
                          context.read<MainBLoC>().clickSomosEmpresas(context);
                        },
                        height: 37,
                        width: 192,
                        colorUp: 0xFFEEEEEE,
                        colorDown: 0xFFEEEEEE,
                        border: 14,
                        borderColor: 0xFFEEEEEE,
                        iconPre: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFDDADADA),
                            shape: BoxShape.circle,
                          ),
                        ),
                        child: TextByHeight(
                          'Somos Empresa',
                          height: 25,
                          textstyle: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFD353B4D),
                          ),
                        ),
                      ),
                      // BotonGradiane(
                      //   text: "Somos Empresa",
                      //   onPressed: () {
                      //     context.read<MainState>().setState(
                      //         id: "popup_pNatural_show", texto: false);
                      //     context
                      //         .read<MainBLoC>()
                      //         .clickSomosEmpresas(context);
                      //   },
                      //   colortext: const Color(0xFF353B4D),
                      //   padingLeft: 0,
                      //   padingRight: 25,
                      //   height: 37,
                      //   width: 192,
                      //   colorUp: 0xFFEEEEEE,
                      //   colorDown: 0xFFEEEEEE,
                      //   border: 20,
                      //   borderColor: 0xFFEEEEEE,
                      //   iconPre: Container(
                      //     height: 20,
                      //     width: 20,
                      //     decoration: const BoxDecoration(
                      //       color: Color(0xFDDADADA),
                      //       shape: BoxShape.circle,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextBoxSubtitle(
                    containerHeight: 40,
                    texto: context
                            .read<MainState>()
                            .getState(TxtStateName.nombresReg) ??
                        "",
                    textoBase: "Nombres",
                    containerWidth: 400,
                    maxlength: 50,
                    formateado: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z]'),
                      ),
                    ],
                    iconPre: SvgPicture.asset(
                      "assets/icons/icon_user.svg",
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                    iconPos: SvgPicture.asset(
                      "assets/icons/next.svg",
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                    onChanged: (text) {
                      context
                          .read<MainState>()
                          .setState(id: TxtStateName.nombresReg, texto: text);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextBoxSubtitle(
                    containerHeight: 40,
                    texto: context
                            .read<MainState>()
                            .getState(TxtStateName.apellidoReg) ??
                        "",
                    textoBase: "Apellidos",
                    containerWidth: 400,
                    maxlength: 50,
                    formateado: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z]'),
                      ),
                    ],
                    iconPre: SvgPicture.asset(
                      "assets/icons/icon_user.svg",
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                    iconPos: SvgPicture.asset(
                      "assets/icons/next.svg",
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                    onChanged: (text) {
                      context
                          .read<MainState>()
                          .setState(id: TxtStateName.apellidoReg, texto: text);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextBoxSubtitle(
                    containerHeight: 40,
                    texto: context
                            .read<MainState>()
                            .getState(TxtStateName.emailReg) ??
                        "",
                    textoBase: "Correo Electrónico",
                    containerWidth: 400,
                    maxlength: 50,
                    formateado: const [],
                    iconPre: SvgPicture.asset(
                      "assets/icons/icon_email.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    iconPos: SvgPicture.asset(
                      "assets/icons/next.svg",
                      height: 16,
                      fit: BoxFit.scaleDown,
                    ),
                    onChanged: (text) {
                      context
                          .read<MainState>()
                          .setState(id: TxtStateName.emailReg, texto: text);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextBoxSubtitle(
                    containerHeight: 40,
                    texto: context
                            .read<MainState>()
                            .getState(TxtStateName.phoneReg) ??
                        "",
                    textoBase: "Celular",
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
                      context
                          .read<MainState>()
                          .setState(id: TxtStateName.phoneReg, texto: text);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      BotonGradiane(
                        text: "Cancelar",
                        fontsize: 5,
                        border: 10,
                        // padingLeft: 0,
                        // padingRight: 0,
                        onPressed: () {
                          context.read<MainBLoC>().resetPop(context);
                        },
                        height: 35,
                        width: 180,
                        colorUp: 0xFFFFFFFF,
                        colorDown: 0xFFFFFFFF,
                        colortext: const Color(0xFF002EA8),
                        alingText: Alignment.center,
                        borderColor: 0xFFF3F3F5,
                      ),
                      const Spacer(),
                      BotonGradiane(
                        fontsize: 5,
                        text: "Registrarme",
                        // padingLeft: 100,
                        // padingRight: 100,
                        onPressed: () {
                          context
                              .read<MainBLoC>()
                              .clickRegistroPersonas(context);
                        },
                        height: 35,
                        width: 180,
                        colorUp: 0xFF002EA8,
                        colorDown: 0xFF002EA8,
                        border: 10,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
