import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walte_soluciones/provider/state/const_state.dart';
import 'package:walte_soluciones/provider/state/const_txt_state_name.dart';
import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

class OptionA extends StatelessWidget {
  const OptionA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDirATextBoxSubtitle = context
        .read<TxtControllersState>()
        .getControladorTxt(TxtStateName.txtDirprincipal);
    Future<void> Function(
      BuildContext context,
      String texto,
      String dirListPrediction,
      String ciudad,
    ) onChangedDirTextBoxSubtitle = context.read<MainBLoC>().updateDirSugestion;

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
                maxlength: 100,
                controller: controllerDirATextBoxSubtitle,
                onChanged: (String texto) async {
                  onChangedDirTextBoxSubtitle(context, texto,
                      ConstState.dirListPredictionA, ConstState.textoBtnciudad);
                },
                formateado: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-z A-Z,-_0-9]'),
                  ),
                ],
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
          ),
        ),
      ],
    );
  }
}
