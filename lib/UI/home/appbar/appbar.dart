import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:walte_soluciones/core/widgets/atomos/botomgradiane.dart';
import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/context/main_state.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainBLoC mB = context.read<MainBLoC>();
    MainState mS = context.read<MainState>();

    void Function(BuildContext context, [bool show]) onClickIniciarSeccion =
        mB.showSingin;

    void Function(BuildContext context, {String city}) onClickCity =
        mB.clickCity;

    void Function(BuildContext context) onClickLogout = mB.clickLogOut;

    String textoBtnCity = mS.getState(ConstState.textoBtnciudad);

    String textoUserNameText = mS.getState(ConstState.userName);

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
                        text: textoBtnCity,
                        fontsize: 12,
                        border: 15,
                        padingLeft: 0,
                        padingRight: 0,
                        onPressed: () {
                          onClickCity(context, city: "");
                        },
                        height: 46,
                        width: 200,
                        colorUp: 0xFFFFFFFF,
                        colorDown: 0xFFFFFFFF,
                        iconPre: SvgPicture.asset("assets/icons/location.svg",
                            color: const Color(0xFF002EA8)),
                        iconPos: SvgPicture.asset(
                            "assets/icons/icon_incity_next.svg",
                            color: const Color(0xFF002EA8)),
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
                    builder: (BuildContext c, String textoAutoId, _) {
                      if (textoAutoId.isEmpty) {
                        return BotonGradiane(
                          text: "Inicia Sesión",
                          onPressed: () async {
                            onClickIniciarSeccion(c);
                          },
                          fontsize: 9,
                          border: 15,
                          padingLeft: 0,
                          padingRight: 0,
                          height: 46,
                          width: 250,
                          colorUp: 0xFF002EA8,
                          colorDown: 0xFF002EA8,
                          enable: true,
                          colortext: const Color(0xFFFFFFFF),
                          alingText: Alignment.center,
                        );
                      } else {
                        return BotonGradiane(
                          // text: "LogOut",
                          onPressed: () {
                            onClickLogout(context);
                          },
                          fontsize: 0,
                          border: 15,
                          padingLeft: 0,
                          padingRight: 0,
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

                          colortext: const Color(0xFFFFFFFF),
                          alingText: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                textoUserNameText,
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
