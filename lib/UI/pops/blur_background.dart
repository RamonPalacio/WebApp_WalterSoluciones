import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:logger/logger.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.read<MainBLoC>().resetPop(context);
          },
          child: const SizedBox.expand().frosted(
              blur: 2, frostColor: const Color(0xFF000000), frostOpacity: 0.6),
        ),
        Align(alignment: Alignment.center, child: child),
      ],
    );
  }
}
