// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextBoxW extends StatelessWidget {
  final Widget iconPre;
  final String texto;
  final String textoBase;
  final Widget iconPos;

  const TextBoxW(
      {Key? key,
      this.iconPre = const SizedBox(),
      this.texto = "",
      this.textoBase = "",
      this.iconPos = const SizedBox()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFC1D2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          iconPre,
          Expanded(
              child: TextFieldIn(
            texto: texto,
            textoBase: textoBase,
          )),
          iconPos,
        ],
      ),
    );
  }
}

class TextFieldIn extends StatelessWidget {
  final String texto;
  final String textoBase;
  final void Function(String)? onChanged;
  final VoidCallback? onPressedOfuscate;
  final List<TextInputFormatter>? formateador;
  final TextInputType? keyboardType;
  final bool isPass;
  final bool isOfuscado;

  const TextFieldIn(
      {Key? key,
      this.texto = "",
      this.onChanged,
      this.onPressedOfuscate,
      this.formateador,
      this.keyboardType,
      this.isPass = false,
      this.isOfuscado = false,
      this.textoBase = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      textInputAction: TextInputAction.next,
      // textAlignVertical: TextAlignVertical.center,
      maxLength: 50,
      textAlign: TextAlign.left,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      inputFormatters: formateador,
      initialValue: texto,
      autocorrect: true,
      keyboardType: keyboardType,
      // strutStyle: const StrutStyle(leading: 0),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Color(0xFF002EA8),
      ),
      obscureText: isPass ? isOfuscado : false,
      cursorColor: const Color(0xFF002EA8),
      decoration: InputDecoration(
          counter: const SizedBox(),

          // counter: Container(width: 10, height: 10, color: Color(0xFF000000)),// Informacion inferior No afecta el Padre

          contentPadding: const EdgeInsets.only(left: 0, top: 10),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          // hintText: textoBase,

          // hintStyle: const TextStyle(
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xFF3F3F3F)),
          labelText: textoBase,
          labelStyle: const TextStyle(
              fontSize: 15.0, color: Color(0xFF002EA8)), //Cambiar con el texto
          filled: false,
          fillColor: const Color(0x00FFFFFF),
          prefixIcon: isPass ? const SizedBox() : null,
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
    );
  }
}

class PosIcon extends StatelessWidget {
  final String assetImageSvg;
  const PosIcon({Key? key, this.assetImageSvg = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return assetImageSvg != ""
        ? Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 18, right: 18, bottom: 18),
            child: SvgPicture.asset(
              assetImageSvg,
              fit: BoxFit.fitHeight,
              height: 50,
              color: Colors.red,
              cacheColorFilter: true,
              colorBlendMode: BlendMode.color,
            ),
          )
        : const SizedBox();
  }
}

class PreIcon extends StatelessWidget {
  final String assetImageSvg;
  const PreIcon({Key? key, this.assetImageSvg = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return assetImageSvg != ""
        ? Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 18, right: 10, bottom: 18),
            child: SvgPicture.asset(
              assetImageSvg,
              fit: BoxFit.fitHeight,
              height: 50,
              color: Colors.red,
              cacheColorFilter: true,
              colorBlendMode: BlendMode.color,
            ),
          )
        : const SizedBox();
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
      color: const Color(0x80002EA8),
    );
  }
}
