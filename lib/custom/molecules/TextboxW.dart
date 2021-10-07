// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TextBoxW(
//                     maxlength: 10,
//                     formateado: [
//                       FilteringTextInputFormatter.allow(
//                         RegExp('[a-zA-Z]'),
//                       ),
//                     ],
//                     enable: true,
//                     iconPre: Padding(
//                       padding: const EdgeInsets.only(
//                           left: 18, right: 10, top: 18, bottom: 18),
//                       child: SvgPicture.asset(
//                         "icons/icon_user.svg",
//                         fit: BoxFit.fill,
//                         height: 20,
//                         width: 20,
//                       ),
//                     ),
//                     texto: "",
//                     textoBase: "Nombres",
//                     iconPos: Padding(
//                       padding: const EdgeInsets.only(
//                           left: 10, right: 18, top: 18, bottom: 18),
//                       child: SvgPicture.asset(
//                         "icons/next.svg",
//                         fit: BoxFit.fill,
//                         height: 20,
//                         width: 20,
//                       ),
//                     ),
//                     gris: true,
//                   ),

/* Ejemplo Blue
TextBoxW(
  iconPre: Padding(
    padding: const EdgeInsets.only(left: 12, right: 6),
    child: SvgPicture.asset(
      "assets/icons/infoicon.svg",
      fit: BoxFit.fitHeight,
      color: const Color(0xFF002EA8),
    ),
  ),
  textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
  texto: "Recoger sobre con documentos",
  iconPos: const Padding(
    padding: EdgeInsets.only(left: 6, right: 12),
    child: ImgCheck(color: 0xFF002EA8, size: 1),
  ),
  gris: false,
),

          */

// class TextBoxW extends StatelessWidget {
//   final Widget iconPre;
//   final String texto;
//   final String textoBase;
//   final Widget iconPos;
//   final bool enable;
//   final List<TextInputFormatter>? formateado;
//   final int maxlength;
//   final bool gris;
//   final void Function(String)? onChanged;

//   const TextBoxW(
//       {Key? key,
//       this.iconPre = const SizedBox(),
//       this.texto = "",
//       this.textoBase = "",
//       this.iconPos = const SizedBox(),
//       this.enable = false,
//       this.formateado,
//       this.maxlength = 50,
//       this.gris = false,
//       this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: gris ? const Color(0xFDEEEEEE) : const Color(0xFDC1D2FF),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           iconPre,
//           TextFormField(),
//           iconPos,
//         ],
//       ),
//     );
//   }
// }

// class TextFieldIn extends StatelessWidget {
//   final String texto;
//   final String textoBase;
//   final void Function(String)? onChanged;
//   final VoidCallback? onPressedOfuscate;
//   final List<TextInputFormatter>? formateador;
//   final TextInputType? keyboardType;
//   final bool isPass;
//   final bool isOfuscado;
//   final bool enable;
//   final int maxlength;
//   final bool gris;
//   const TextFieldIn(
//       {Key? key,
//       this.texto = "",
//       this.onChanged,
//       this.onPressedOfuscate,
//       this.formateador,
//       this.keyboardType,
//       this.isPass = false,
//       this.isOfuscado = false,
//       this.textoBase = "",
//       this.enable = true,
//       required this.maxlength,
//       required this.gris})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 40,
          
//           child: TextFormField(
//             controller: TextEditingController(text: texto),
//             textInputAction: TextInputAction.next,
//             maxLength: maxlength,
//             textAlign: TextAlign.left,
//             textAlignVertical: TextAlignVertical.center,
//             inputFormatters: formateador,
//             autocorrect: true,
//             keyboardType: keyboardType,
//             //expands: true,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 27.0,
//               color: gris ? const Color(0xFD353B4D) : const Color(0xFF002EA8),
//             ),
//             obscureText: isPass ? isOfuscado : false,
//             cursorColor:
//                 gris ? const Color(0xFD353B4D) : const Color(0xFF002EA8),
//             decoration: InputDecoration(
//                 counter: const SizedBox(),
//                 // constraints: BoxConstraints(minHeight: 50, minWidth: 20),

//                 // counter: Container(width: 10, height: 10, color: Color(0xFF000000)),// Informacion inferior No afecta el Padre

//                 contentPadding: const EdgeInsets.only(left: 0, top: 3),
//                 focusedBorder: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 errorBorder: InputBorder.none,
//                 disabledBorder: InputBorder.none,
//                 // hintText: textoBase,

//                 // hintStyle: const TextStyle(
//                 //     fontSize: 20.0,
//                 //     fontWeight: FontWeight.bold,
//                 //     color: Color(0xFF3F3F3F)),
//                 labelText: textoBase,
//                 labelStyle: TextStyle(
//                     letterSpacing: -1,
//                     fontSize: 15.0,
//                     color: gris
//                         ? const Color(0xFD353B4D)
//                         : const Color(0xFF002EA8)), //Cambiar con el texto
//                 filled: false,
//                 fillColor: const Color(0x00FFFFFF),
//                 prefixIcon: isPass ? const SizedBox() : null,
//                 suffixIcon: isPass
//                     ? SizedBox(
//                         height: double.infinity,
//                         // width: 5,
//                         child: BtnOfuscar(
//                           isOfuscado,
//                           onPressed: onPressedOfuscate,
//                         ),
//                       )
//                     : null),
//             onChanged: (text) {
//               // onChanged!(text);
//             },
//             enabled: enable,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PosIcon extends StatelessWidget {
//   final String assetImageSvg;
//   const PosIcon({Key? key, this.assetImageSvg = ""}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return assetImageSvg != ""
//         ? SvgPicture.asset(
//             assetImageSvg,
//             fit: BoxFit.fitHeight,
//             color: Colors.red,
//             cacheColorFilter: true,
//             colorBlendMode: BlendMode.color,
//           )
//         : const SizedBox();
//   }
// }

// class PreIcon extends StatelessWidget {
//   final String assetImageSvg;
//   const PreIcon({Key? key, this.assetImageSvg = ""}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return assetImageSvg != ""
//         ? SvgPicture.asset(
//             assetImageSvg,
//             fit: BoxFit.fitHeight,
//             color: Colors.red,
//             cacheColorFilter: true,
//             colorBlendMode: BlendMode.color,
//           )
//         : const SizedBox();
//   }
// }

// class BtnOfuscar extends StatelessWidget {
//   const BtnOfuscar(this.isOfuscado, {Key? key, this.onPressed})
//       : super(key: key);

//   final bool isOfuscado;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: Icon(
//         isOfuscado ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
//       ),
//       color: const Color(0x80002EA8),
//     );
//   }
// }
