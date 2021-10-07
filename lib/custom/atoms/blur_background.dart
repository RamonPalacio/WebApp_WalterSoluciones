import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';
import 'dart:ui' as ui;

class BackGroudBlur2 extends StatelessWidget {
  const BackGroudBlur2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MainBLoC>().resetPop(context);
      },
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          // height: 500,
          // width: 500,
          // color: const Color(0xFD000000),
          decoration: BoxDecoration(
            color: const Color(0x00000000),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class BackGroudBlur extends StatelessWidget {
  const BackGroudBlur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MainBLoC>().resetPop(context);
      },
      child: const SizedBox().frosted(
          blur: 2, frostColor: const Color(0xFFFF0000), frostOpacity: 0),
    );
  }
}
