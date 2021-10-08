import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

class OptionA extends StatelessWidget {
  const OptionA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF002EA8),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: const Text("A",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: InkWell(
              onTap: () {},
              child: TextBoxSubtitle(
                controller: context
                    .read<TxtControllersState>()
                    .getControladorTxt(TxtStateName.txtDirprincipal),
                onChanged: (String texto) async {
                  String ciudad =
                      context.read<MainState>().getState(ConstState.btnciudad);
                  context.read<MainState>().setState(
                        id: ConstState.dirListPrediction,
                        texto:
                            await EndPointApi().getUbicacion("$texto, $ciudad"),
                        updateGeneralState: true,
                      );
                },
                formateado: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-z A-Z,0-9]'),
                  ),
                ],
                textFieldAltura: 30,
                enable: true,
                iconPre: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 6),
                  child: SvgPicture.asset(
                    "assets/icons/infoicon.svg",
                    color: const Color(0xFF353B4D),
                    height: 16,
                    fit: BoxFit.fitHeight,
                  ),

                  // Img(color: 0xFF353B4D, size: 1),
                ),
                textoBase: "Ingresar dirección o sitio",
                iconPos: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 0),
                  child: SvgPicture.asset(
                    "assets/icons/check.svg",
                    color: const Color(0xFF353B4D),
                    height: 16,
                    fit: BoxFit.fitHeight,
                  ),

                  //  ImgCheck(color: 0xFF353B4D, size: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
