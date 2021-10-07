// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextBoxs extends StatelessWidget {
  //

  final String texto;
  final String textoBase;
  final int limitLength;
  final int selectPosition;
  final String iconPreText;
  final bool isPass;
  final bool isOfuscado;
  final void Function(String)? onChanged;
  final VoidCallback? onPressedOfuscate;
  final List<TextInputFormatter>? formateador;
  final TextInputType? keyboardType;
  //
  const TextBoxs(
      {Key? key,
      this.texto = "",
      this.textoBase = "",
      this.limitLength = 50,
      this.selectPosition = 0,
      this.iconPreText = "",
      this.isPass = false,
      this.isOfuscado = false,
      this.onChanged,
      this.onPressedOfuscate,
      this.formateador,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color(0xFFEDEDED),
            Color(0xFFEDEDED),
            Color(0xFFEDEDED),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Transform.translate(
        offset: Offset(0, isPass ? 0 : -10),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          //     isPass ? TextAlignVertical(y: -0.6) : TextAlignVertical.top,
          maxLength: limitLength,

          textAlign: TextAlign.center,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: formateador,
          initialValue: texto,
          autocorrect: false,
          keyboardType: keyboardType,
          strutStyle: const StrutStyle(leading: 0),
          style: const TextStyle(
            // height: isPass ? null : 0.5,
            // backgroundColor: Color(0xFF64328A),
            fontSize: 20.0,
            color: Color(0xFF64328A),
          ),
          obscureText: isPass ? isOfuscado : false,
          // : context.read<TextBoxState>().getOfuscado(this.id),
          cursorColor: const Color(0xFF64328A),
          decoration: InputDecoration(
              counter: const SizedBox(),

              // counter: Container(width: 10, height: 10, color: Color(0xFF000000)),// Informacion inferior No afecta el Padre

              contentPadding: const EdgeInsets.only(left: 5, top: 10),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // focusColor: Color(0xFF64328A),
              // hoverColor: Color(0xFF64328A),
              hintText: textoBase,
              hintStyle:
                  const TextStyle(fontSize: 20.0, color: Color(0x8164328A)),
              // labelText: "sds",
              filled: false,
              fillColor: const Color(0x00FFFFFF),
              prefixIcon: isPass
                  ? const SizedBox()
                  : iconPreText != ""
                      ? SvgPicture.asset(iconPreText, fit: BoxFit.fill)
                      : null,
              suffixIcon: isPass
                  ? SizedBox(
                      height: double.infinity,
                      // width: 5,
                      child: BtnOfuscar(
                        isOfuscado,
                        onPressed: onPressedOfuscate,
                      ),
                    )
                  : null),
          onChanged: (text) {
            onChanged!(text);
          },
        ),
      ),
    );
  }
}

class BtnOfuscar extends StatelessWidget {
  const BtnOfuscar(this.isOfuscado, {Key? key, this.onPressed})
      : super(key: key);

  final bool isOfuscado;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isOfuscado ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
      ),
      color: const Color(0x8064328A),
    );
  }
}
