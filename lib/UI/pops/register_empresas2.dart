import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/database/constant/const_styles.dart';
import 'package:walte_soluciones/provider/state/const_txt_state_name.dart';
import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';

import 'package:walte_soluciones/core/widgets/atomos/text_by_height.dart';
import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class RegisterEmpresas2 extends StatelessWidget {
  const RegisterEmpresas2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainBLoC mB = context.read<MainBLoC>();
    MainState mS = context.read<MainState>();

    Function clickRegistrarme = mB.showPopUpRegExitoso;
    Function clickPersonaNatural = mB.showPopUpRegPersonas;

    //TextBox Empresa
    String textoEmpresaTextBoxSubtitle =
        mS.getState(TxtStateName.rezonsocialRegE) ?? "";
    Function onChangedEmpresaTextBoxSubtitle = mS.setState;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextByHeight(
                    'Reg??strate ahora',
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
                  Row(children: [
                    Image.asset(
                      "assets/icons/user_circle.png",
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      'Empresa',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFD002EA8),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Paso 2 de 2',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFD353B4D),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      BotonGradiane(
                        padingLeft: 10,
                        padingRight: 30,
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
                        onPressed: () {
                          clickPersonaNatural(context);
                        },
                        child: TextByHeight(
                          'Persona Natural',
                          height: 25,
                          textstyle: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFD353B4D),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
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
                          'Somos Empresa',
                          height: 25,
                          textstyle: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFD002EA8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FocusTraversalGroup(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: () {
                        Form.of(primaryFocus!.context!)!.save();
                      },
                      child: Column(
                        children: [
                          TextBoxSubtitle(
                            containerHeight: 40,
                            texto: textoEmpresaTextBoxSubtitle,
                            textoBase: "Empresa",
                            containerWidth: 400,
                            maxlength: 50,
                            formateado: const [],
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
                              onChangedEmpresaTextBoxSubtitle(
                                id: TxtStateName.rezonsocialRegE,
                                texto: text,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextBoxSubtitle(
                                  maxlength: 10,
                                  formateado: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z]'),
                                    ),
                                  ],
                                  enable: true,
                                  iconPre: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18,
                                        right: 10,
                                        top: 18,
                                        bottom: 18),
                                    child: SvgPicture.asset(
                                      "assets/icons/note.svg",
                                      height: 20,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  texto: "",
                                  textoBase: "Nit",
                                  iconPos: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 18,
                                        top: 18,
                                        bottom: 18),
                                    child: SvgPicture.asset(
                                      "assets/icons/chevron_big_down.svg",
                                      height: 10,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: TextBoxSubtitle(
                                  containerHeight: 40,
                                  texto: context
                                          .read<MainState>()
                                          .getState(TxtStateName.nitRegE) ??
                                      "",
                                  textoBase: "Nit",
                                  containerWidth: 400,
                                  maxlength: 15,
                                  formateado: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'),
                                    ),
                                  ],
                                  iconPos: SvgPicture.asset(
                                    "assets/icons/next.svg",
                                    height: 16,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  onChanged: (text) {
                                    context.read<MainState>().setState(
                                        id: TxtStateName.nitRegE, texto: text);
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextBoxSubtitle(
                            containerHeight: 40,
                            texto: context
                                    .read<MainState>()
                                    .getState(TxtStateName.dirRegE) ??
                                "",
                            textoBase: "Direccion",
                            containerWidth: 400,
                            maxlength: 50,
                            formateado: const [],
                            iconPre: SvgPicture.asset(
                              "assets/icons/location_gris.svg",
                              fit: BoxFit.scaleDown,
                            ),
                            iconPos: SvgPicture.asset(
                              "assets/icons/next.svg",
                              height: 16,
                              fit: BoxFit.scaleDown,
                            ),
                            onChanged: (text) {
                              context.read<MainState>().setState(
                                  id: TxtStateName.dirRegE, texto: text);
                            },
                          ),
                          const SizedBox(height: 10),
                          TextBoxSubtitle(
                            containerHeight: 40,
                            texto: context
                                    .read<MainState>()
                                    .getState(TxtStateName.phonelocalRegE) ??
                                "",
                            textoBase: "Telefono Fijo",
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
                                  id: TxtStateName.phonelocalRegE, texto: text);
                            },
                          ),
                          const SizedBox(height: 10),
                          TextBoxSubtitle(
                            containerHeight: 40,
                            texto: context.read<MainState>().getState(
                                    "fijoindustria_registroE2_textbox") ??
                                "",
                            textoBase: "Telefono de Industria",
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
                                  id: TxtStateName.phoneIndRegE, texto: text);
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      BotonGradiane(
                        text: "Cancelar",
                        fontsize: 5,
                        border: 10,
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
                        onPressed: () {
                          clickRegistrarme(context);
                        },
                        height: 35,
                        width: 180,
                        colorUp: 0xFF002EA8,
                        colorDown: 0xFF002EA8,
                        border: 10,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
