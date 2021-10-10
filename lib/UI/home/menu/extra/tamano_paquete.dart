import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/core/widgets/atomos/textbox_subtitle.dart';
import 'package:walte_soluciones/provider/context/constant/const_styles.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';
import 'package:walte_soluciones/provider/context/txt_controllers_state.dart';
import 'package:walte_soluciones/provider/logic/main_bloc.dart';

class ShippingProperties extends StatelessWidget {
  const ShippingProperties({Key? key, this.texto = ""}) : super(key: key);
  final String texto;

  @override
  Widget build(BuildContext context) {
    void Function(BuildContext context) onClickTamanoTextBoxSubtitle =
        context.read<MainBLoC>().showTamano;
    TextEditingController txtTamanoController = context
        .read<TxtControllersState>()
        .getControladorTxt(TxtStateName.txtTamano);
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: boxDecoration,
      child: Column(
        children: [
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              onClickTamanoTextBoxSubtitle(context);
            },
            child: TextBoxSubtitle(
              enable: false,
              containerWidth: double.infinity,
              iconPre: Padding(
                padding: const EdgeInsets.only(left: 0, right: 6),
                child: SvgPicture.asset("assets/icons/box.svg",
                    height: 16,
                    color: const Color(0xFF353B4D),
                    fit: BoxFit.fitHeight),
              ),
              textoBase: "Tamaño del envio",
              controller: txtTamanoController,
              iconPos: Padding(
                padding: const EdgeInsets.only(left: 6, right: 0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/icon_incity_next.svg",
                    height: 16,
                    color: const Color(0xFF353B4D),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextBoxSubtitle(
            containerWidth: double.infinity,
            textFieldAltura: 30,
            iconPre: Padding(
              padding: const EdgeInsets.only(left: 0, right: 6),
              child: SvgPicture.asset("assets/icons/money.svg",
                  height: 16,
                  color: const Color(0xFF353B4D),
                  fit: BoxFit.fitHeight),
            ),
            textoBase: "Asegura tu servicio",
            texto: "Asegurado por \$ 50.000",
            iconPos: Padding(
              padding: const EdgeInsets.only(left: 6, right: 0),
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/icon_incity_next.svg",
                  height: 16,
                  color: const Color(0xFF353B4D),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
