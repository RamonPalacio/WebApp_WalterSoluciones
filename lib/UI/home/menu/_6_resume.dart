import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:walte_soluciones/custom/molecules/botomgradiane.dart';
import 'package:walte_soluciones/provider/BLoC/mainbloc.dart';

class ResumenPedido extends StatelessWidget {
  const ResumenPedido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      width: double.infinity,
      // color: const Color(0xFFCED390),
      child: Column(
        children: [
          const Text(
            "Valor a Pagar: \$ 7.200",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002EA8)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            width: 250,
            child: BotonGradiane(
              text: "Ir a Pagar",
              onPressed: () {
                context.read<MainBLoC>().resetPop(context);
                context.read<MainBLoC>().clickRegistroOTP(context);
              },
              padingLeft: 50,
              padingRight: 50,
              height: 57,
              width: 188,
              colorUp: 0xFF002EA8,
              colorDown: 0xFF002EA8,
              border: 20,
            ),
          ),
        ],
      ),
    );
  }
}
