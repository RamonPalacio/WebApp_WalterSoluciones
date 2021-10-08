import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/UI/pops/blur_background.dart';
import 'package:walte_soluciones/UI/pops/register_empresas.dart';
import 'package:walte_soluciones/UI/pops/register_empresas2.dart';
import 'package:walte_soluciones/UI/pops/register_new_otp.dart';
import 'package:walte_soluciones/UI/pops/register_personas.dart';
import 'package:walte_soluciones/UI/pops/registers_otp.dart';
import 'package:walte_soluciones/UI/pops/registro_exitoso.dart';
import 'package:walte_soluciones/UI/pops/select_city.dart';
import 'package:walte_soluciones/UI/pops/select_tamano.dart';
import 'package:walte_soluciones/UI/pops/singin.dart';
import 'package:walte_soluciones/constant/pages_show_state.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

import 'appbar/appbar.dart';
import 'mapa/mapbox.dart';
import 'menu/__menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 20
                    // child:
                    //     Text("maxheight:${hw.maxHeight} maxWidth:${hw.maxWidth}"),
                    ),
                const AppBarHome(),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: const Color(0xFFFFFFFF),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Consumer<MainState>(
                                builder: (c, modelState, _) {
                              return const Menu();
                            }),
                          ),
                          Visibility(
                            visible: MediaQuery.of(context).size.width < 800
                                ? false
                                : true,
                            child: Expanded(
                              flex: MediaQuery.of(context).size.width < 1500
                                  ? MediaQuery.of(context).size.width < 1000
                                      ? 2
                                      : 3
                                  : 6,
                              // child: SizedBox(),
                              child: const MapBox(),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Consumer<MainState>(builder: (c, modelState, _) {
              ///Muestra el PopSingin [Login]

              if (modelState.getState(PagesShowState.singinshow)) {
                return const BlurBackground(child: SingIn());
              }

              if (modelState.getState(PagesShowState.legal1show)) {
                return const BlurBackground(child: RegirterEmpresas());
              }

              if (modelState.getState(PagesShowState.tamanoshow)) {
                return const BlurBackground(child: SelectTamano());
              }

              if (modelState.getState(PagesShowState.reotpshow)) {
                return const BlurBackground(child: RegisterNewOtp());
              }

              if (modelState.getState(PagesShowState.otpshow)) {
                return const BlurBackground(child: RegisterOtp());
              }

              if (modelState.getState(PagesShowState.exitososhow)) {
                return const BlurBackground(child: RegisterExitoso());
              }

              if (modelState.getState(PagesShowState.legal2show)) {
                return const BlurBackground(child: RegisterEmpresas2());
              }

              if (modelState.getState(PagesShowState.naturalshow)) {
                return const BlurBackground(child: RegisterPersonas());
              }

              if (modelState.getState(PagesShowState.cityshow)) {
                return const BlurBackground(child: SelectCity());
              } else {
                return const SizedBox();
              }
            })
            //
          ],
        ),
      ),
    );
  }
}
