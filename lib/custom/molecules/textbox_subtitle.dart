import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*


TextBoxSubtitle(
  containerHeight: 40,
  texto: context
          .read<InputState>()
          .getTexto("nombres_registro_textbox") ??
      "",
  textoBase: "Nombres",
  containerWidth: 400,
  maxlength: 50,
  formateado: [
    FilteringTextInputFormatter.allow(
      RegExp('[a-z A-Z]'),
    ),
  ],
  iconPre: SvgPicture.asset(
    "assets/icons/icon_user.svg",
    height: 16,
    fit: BoxFit.fitHeight,
  ),
  iconPos: SvgPicture.asset(
    "assets/icons/next.svg",
    height: 16,
    fit: BoxFit.fitHeight,
  ),
  onChanged: (text) {
    context.read<InputState>().setTexto(
        id: "nombres_registro_textbox", texto: text);
  },
),



*/
class TextBoxSubtitle extends StatelessWidget {
  const TextBoxSubtitle({
    Key? key,
    this.containerColor = const Color(0xFFE1E1E1),
    this.containerHeight = 35,
    this.containerWidth = 400,
    this.containerBorderRadius = 8,
    this.textFieldAltura = 30,
    this.preIconWidth = 30,
    this.posIconWidth = 30,
    this.maxlength = 50,
    this.validate = false,
    this.iconPre,
    this.texto = " ",
    this.textoBase = "",
    this.iconPos,
    this.keyboardType,
    this.formateado,
    this.enable = true,
    this.isPass = false,
    this.isOfuscado = false,
    this.onChanged,
    this.onPressedOfuscate,
    this.autofocus = false,
    this.letterSpacing,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Widget? iconPre;
  final String texto;
  final double? letterSpacing;
  final String textoBase;
  final Widget? iconPos;
  final double containerHeight;
  final double containerWidth;
  final double textFieldAltura;
  final Color? containerColor;
  final double containerBorderRadius;
  final double preIconWidth;
  final double posIconWidth;
  final bool validate;
  final bool enable;
  final List<TextInputFormatter>? formateado;
  final int maxlength;
  final bool isPass;
  final bool isOfuscado;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final VoidCallback? onPressedOfuscate;
  final bool autofocus;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      //!Contenedor Text
      decoration: BoxDecoration(
        color: containerColor, //const Color(0xFDC1D2FF),
        borderRadius: BorderRadius.circular(containerBorderRadius),
      ),
      height: containerHeight,

      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            //!Text
            height: textFieldAltura,
            child: Row(
              children: [
                //!PreIcon_Space
                SizedBox(
                    height: textFieldAltura,
                    width: iconPre == null ? 1 : preIconWidth),
                //!-------
                Expanded(
                  //! Texto Central
                  child: Transform.translate(
                    offset: const Offset(0, 3),
                    child: TextFormField(
                      autofocus: autofocus,
                      initialValue: texto,
                      // controller: TextEditingController(text: texto),
                      obscureText: isPass ? isOfuscado : false,
                      textInputAction: TextInputAction.next,
                      maxLength: maxlength,
                      textAlign: textAlign,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: formateado,
                      autocorrect: true,
                      keyboardType: keyboardType,
                      //! Texto CentralStyle
                      style: TextStyle(
                        letterSpacing: letterSpacing,
                        fontSize: 20,
                        height: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 0, right: 3, top: 14, bottom: 14),
                        errorStyle: const TextStyle(fontSize: 9, height: 0.3),
                        // contentPadding:
                        //     const EdgeInsets.symmetric(vertical: 15.0),
                        // hintText: "cuando no hay nada",
                        // labelText: textoBase,
                        label: Text(textoBase),
                        counter: const SizedBox(),

                        // alignLabelWithHint: true,

                        // focusColor: const Color(0xFF002EA8),
                        // hoverColor: const Color(0xFF002EA8),
                        // fillColor: const Color(0xFF002EA8),
                        floatingLabelStyle: const TextStyle(
                          //! Subtitle posclick
                          color: Color(0xFD353B4D), // Color(0xFF002EA8),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                          letterSpacing: 0,
                        ),
                        labelStyle: const TextStyle(
                          //! Subtitle preclick
                          // color: Color(0xFF353B4D),
                          // leadingDistribution: TextLeadingDistribution.proportional,
                          overflow: TextOverflow.ellipsis,

                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0,
                          // fontSize: 13,
                          color: Color(0xFD353B4D),
                        ),

                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: Color(0x00000000))),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: Color(0x00000000))),
                        errorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: Color(0x00000000))),
                        disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: Color(0x00000000))),
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),
                //!PosIcon_Space
                SizedBox(
                    height: textFieldAltura,
                    width: iconPos == null ? 1 : posIconWidth),
              ],
            ),
          ),
          Row(
            children: [
              //! PreIcon_Icon
              Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  alignment: Alignment.centerLeft,
                  height: containerHeight,
                  child: iconPre ?? const SizedBox()),
              const Spacer(),
              //! PosIcon_Icon
              Container(
                  padding: const EdgeInsets.only(right: 5.0),
                  alignment: Alignment.centerRight,
                  height: containerHeight,
                  child: iconPos ?? const SizedBox()),
            ],
          ),
        ],
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
      color: const Color(0x80002EA8),
    );
  }
}
