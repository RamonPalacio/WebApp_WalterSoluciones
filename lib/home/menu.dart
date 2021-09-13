import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final sc = ScrollController();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const InitialLocation(),
          const SizedBox(height: 16),
          const SecondLocation(),
          const SizedBox(height: 16),
          Row(
            children: [
              Row(children: [
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC0C0C0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 6),
                const Text("Ida y Vuelta"),
              ]),
              const Spacer(),
              SizedBox(
                height: 33,
                width: 200,
                child: SvgPicture.asset(
                  "icons/addAddress.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // const SecondLocation(),
          SizedBox(
            height: 168,
            child: Stack(
              children: [
                ListView(
                  controller: sc,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        sc.position.jumpTo(500);
                      },
                      child: Container(
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset("assets/icons/doc.png"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00FF15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1100FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF00DD),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE600),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00FF15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      sc.position.jumpTo(sc.position.pixels - 70);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFC0C0C0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      // color: const Color(0x7CFFFFFF),
                      child: const Text(
                        "<",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      sc.position.jumpTo(sc.position.pixels + 70);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFC0C0C0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      // color: const Color(0x7CFFFFFF),
                      child: const Text(
                        ">",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
