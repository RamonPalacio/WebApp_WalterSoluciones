import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';
import 'package:walte_soluciones/core/widgets/atomos/text_by_height.dart';
import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/context/constant/const_styles.dart';
import 'package:walte_soluciones/provider/context/main_state.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';

class SelectDeclaredValue extends StatelessWidget {
  const SelectDeclaredValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void Function(BuildContext context, [bool show]) onClickAceptar =
        context.read<MainBLoC>().showSelectValorDeclarado;
    // double valueDeclarate =
    //     context.read<MainState>().getState(ConstState.valueDeclarate);
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 500,
        width: 450,
        decoration: boxDecoration,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Text(
                'Asegura tu servicio',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD002EA8),
                ),
              ),
              Text(
                'Valor mercancia a asegurar',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFD353B4D),
                ),
              ),
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 400,
                  height: 200,
                  color: const Color(0xFFEEEEEE),
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 49,
                          width: 226,
                          color: const Color(0xFFC1D2FF),
                          alignment: Alignment.center,
                          child: Selector<MainState, double>(
                              selector: (_, find) =>
                                  find.getState(ConstState.valueDeclarate),
                              builder: (_, valueDeclarate, __) {
                                var percent = NumberFormat.currency(
                                    locale: 'en_US',
                                    decimalDigits: 0,
                                    symbol: "\$");

                                return TextByHeight(
                                    percent
                                        .format(valueDeclarate * 1000)
                                        .toString(),
                                    height: 33);
                              }),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Selector<MainState, double>(
                          selector: (_, find) =>
                              find.getState(ConstState.valueDeclarate),
                          builder: (_, valueDeclarate, __) {
                            return Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/slider_line.svg",
                                  height: 50,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Slider(
                                  thumbColor: Colors.lightBlue[900],
                                  inactiveColor: Colors.transparent,
                                  activeColor: Colors.transparent,
                                  min: 50,
                                  max: 2000,
                                  value: valueDeclarate,
                                  onChanged: (value) {
                                    // Logger().d(value);
                                    context
                                        .read<MainBLoC>()
                                        .cambiarValorDeclarado(context,
                                            valorDeclarado:
                                                value.round().toDouble());
                                    // context.read<MainState>().setState(
                                    //       id: ConstState.valueDeclarate,
                                    //       texto: value.round(),
                                    //       updateGeneralState: true,
                                    //     );
                                  },
                                ),
                              ],
                            );
                          }),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Mínimo\n\$50.000',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF002EA8),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Máximo\n\$2.000.000',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF002EA8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '1% cargo sobre valor declarado',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF353B4D),
                ),
              ),
              Text(
                '\$500',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF353B4D),
                ),
              ),
              const SizedBox(height: 24),
              BotonGradiane(
                fontsize: 15,
                width: 288,
                height: 57,
                text: "Aceptar",
                colorUp: 0xFF002EA8,
                colorDown: 0xFF002EA8,
                onPressed: () {
                  onClickAceptar(context, false);
                  // context
                  //     .read<MainBLoC>()
                  //     .showSelectValorDeclarado(context, false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
