import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/UI/home/menu/_1_ubica_inicial.dart';

import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/atoms/img_money.dart';
import 'package:walte_soluciones/custom/atoms/img_packet.dart';
import 'package:walte_soluciones/custom/molecules/textbox_subtitle.dart';

import 'provider/BLoC/main_provider_bloc.dart';

// class ShippingProperties extends StatelessWidget {
//   const ShippingProperties({Key? key, this.texto = ""}) : super(key: key);
//   final String texto;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       // height: 168,
//       width: double.infinity,
//       // color: const Color(0xFFFFFFFF),
//       decoration: boxDecoration,
//       child: Column(
//         children: [
//           const SizedBox(height: 10),
//           InkWell(
//             onTap: () {
//               context.read<MainBLoC>().clickTamano(context, tamano: "");
//             },
//             child: TextBoxSubtitle(
//               iconPre: const Padding(
//                 padding: EdgeInsets.only(left: 12, right: 6),
//                 child: ImgPacket(color: 0xFF002EA8, size: 1),
//               ),
//               textoBase: "Tamaño del envio",
//               texto: texto, //? nombre Boton Tamaño
//               iconPos: const Padding(
//                 padding: EdgeInsets.only(left: 6, right: 12),
//                 child: ImgCheck(color: 0xFF002EA8, size: 1),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const TextBoxSubtitle(
//             iconPre: Padding(
//               padding: EdgeInsets.only(left: 6, right: 12),
//               child: ImgMoney(color: 0xFF002EA8, size: 1),
//             ),
//             textoBase: "Asegura tu servicio",
//             texto: "Asegurado por \$ 50.000",
//             iconPos: Padding(
//               padding: EdgeInsets.only(left: 6, right: 12),
//               child: ImgCheck(color: 0xFF002EA8, size: 1),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
