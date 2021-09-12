import 'package:flutter/material.dart';
import 'package:walte_soluciones/home/widgets/shipping_properties.dart';
import 'package:walte_soluciones/home/widgets/ubica_inicial.dart';
import 'package:walte_soluciones/home/widgets/ubica_second.dart';
import 'package:walte_soluciones/main.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          const InitialLocation(),
          const SizedBox(height: 16),
          const SecondLocation(),
          const SizedBox(height: 16),
          Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xFFFFFFFF),
          ),
          const SizedBox(height: 16),
          // const SecondLocation(),
          const Placeholder(
            fallbackHeight: 168,
          ),
          const SizedBox(height: 16),
          // const SecondLocation(),
          const ShippingProperties(),
          const SizedBox(height: 16),
          SizedBox(
            height: 114,
            width: double.infinity,
            // color: const Color(0xFFCED390),
            child: Column(
              children: const [
                Text(
                  "Valor a Pagar: \$ 7.200",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002EA8)),
                ),
                SizedBox(height: 16),
                SizedBox(
                    height: 50,
                    width: 250,
                    child: BlueButton(text: 'Ir a Pagar')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
