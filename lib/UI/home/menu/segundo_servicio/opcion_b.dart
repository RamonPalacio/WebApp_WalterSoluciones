import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';
import 'package:walte_soluciones/data/database/endpoint_api.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

class OptionB extends StatelessWidget {
  const OptionB({
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
            color: Color(0xFFED6C1D),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: const Text("B",
              style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextBoxSubtitle(
            controller: context
                .read<TxtControllersState>()
                .getControladorTxt(TxtStateName.txtDirsecundario),
            onChanged: (String texto) async {
              String ciudad =
                  context.read<MainState>().getState(ConstState.btnciudad);
              context.read<MainState>().setState(
                    id: ConstState.dirListPredictionB,
                    texto: await EndPointApi().getUbicacion("$texto, $ciudad"),
                    updateGeneralState: true,
                  );
            },
            formateado: [
              FilteringTextInputFormatter.allow(
                RegExp('[a-z A-Z,-_0-9]'),
              ),
            ],
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: const EdgeInsets.only(left: 0, right: 6),
              child: SvgPicture.asset(
                "assets/icons/infoicon.svg",
                color: const Color(0xFF353B4D),
                height: 16,
                fit: BoxFit.fitHeight,
              ),
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
            ),
          ),
        ),
      ],
    );
  }
}
