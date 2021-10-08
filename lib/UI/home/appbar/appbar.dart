import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';
import 'package:walte_soluciones/custom/atoms/img_market.dart';

import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 56,
            child: SizedBox(
              height: 65,
              width: 196,
              child: Image.asset('assets/Logo.png'),
            ),
          ),
          Positioned(
            right: 60,
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: Consumer<MainState>(builder: (c, modelState, _) {
                      return BotonGradiane(
                        text: context
                            .read<MainState>()
                            .getState(ConstState.btnciudad),
                        fontsize: 12,
                        border: 15,
                        padingLeft: 0,
                        padingRight: 0,
                        onPressed: () {
                          c.read<MainBLoC>().clickCity(context, city: "");
                        },
                        height: 46,
                        width: 200,
                        colorUp: 0xFFFFFFFF,
                        colorDown: 0xFFFFFFFF,
                        iconPre: const ImgMarker(color: 0xFF002EA8),
                        iconPos: SvgPicture.asset(
                            "assets/icons/icon_incity_next.svg",
                            color: const Color(0xFF002EA8)),
                        enable: true,
                        colortext: const Color(0xFF002EA8),
                        alingText: Alignment.centerLeft,
                        borderColor: 0xFFF3F3F5,
                      );
                    }),
                  ),
                  const SizedBox(width: 16),
                  Selector<MainState, String>(
                    selector: (c, find) {
                      return find.getState(ConstState.userAutoId);
                    },
                    builder: (BuildContext c, String getTextoValue, _) {
                      if (getTextoValue == "") {
                        return BotonGradiane(
                          text: "Inicia Sesión",
                          fontsize: 9,
                          border: 15,
                          padingLeft: 0,
                          padingRight: 0,
                          onPressed: () async {
                            context.read<MainBLoC>().clickbtnSignIn(c);
                          },
                          height: 46,
                          width: 250,
                          colorUp: 0xFF002EA8,
                          colorDown: 0xFF002EA8,
                          enable: true,
                          colortext: const Color(0xFFFFFFFF),
                          alingText: Alignment.center,
                        );
                      } else {
                        // return Text(getTextoValue);
                        return BotonGradiane(
                          fontsize: 0,
                          border: 15,
                          padingLeft: 0,
                          padingRight: 0,
                          onPressed: () {
                            c.read<MainBLoC>().clickLogOut(context);
                          },
                          height: 46,
                          width: 300,
                          colorUp: 0xFFFF6C37,
                          colorDown: 0xFFFF6C37,
                          iconPre: SvgPicture.asset(
                              "assets/icons/user_circle.svg",
                              height: 16,
                              fit: BoxFit.scaleDown,
                              color: const Color(0xFFFFFFFF)),
                          iconPos: SvgPicture.asset(
                              "assets/icons/icon_incity_next.svg",
                              color: const Color(0xFFFFFFFF)),
                          enable: true,
                          colortext: const Color(0xFFFFFFFF),
                          alingText: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                c
                                    .read<MainState>()
                                    .getState(ConstState.userName),
                                style:
                                    const TextStyle(color: Color(0xFFFFFFFF)),
                              ),
                              const Spacer(),
                              const Text(
                                "Salir",
                                style: TextStyle(color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        );

                        // BotonGradiane(
                        //     text: "Cerrar Sesión\n$getTextoValue",
                        //     fontsize: 9,
                        //     border: 15,
                        //     padingLeft: 0,
                        //     padingRight: 0,
                        //     onPressed: () {
                        //       context.read<MainBLoC>().clicksingIn(context);
                        //     },
                        //     height: 46,
                        //     width: 250,
                        //     colorUp: 0xFFFFFFFF,
                        //     colorDown: 0xFFFFFFFF,
                        //     enable: true,
                        //     colortext: const Color(0xFF002EA8),
                        //     alingText: Alignment.center,
                        //     borderColor: 0xFFEEEEEE,
                        //     iconPre: SvgPicture.asset(
                        //         "assets/icons/icon_user.svg",
                        //         color: const Color(0xFD353B4D)))

                        // ;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
