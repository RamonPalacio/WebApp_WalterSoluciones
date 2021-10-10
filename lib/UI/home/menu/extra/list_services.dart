import 'package:flutter/material.dart';

class AccionesMensajero extends StatelessWidget {
  const AccionesMensajero({
    Key? key,
    required this.sc,
    required this.texto,
    required this.imagen,
    this.select = false,
  }) : super(key: key);

  final ScrollController sc;
  final String texto;
  final String imagen;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO_ Implementar comportamiento a los Botones Select Tipo de Paquete.
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 140,
            height: 168,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(select ? 0xFF002EA8 : 0xFFC1D2FF),
                width: 2,
              ),
              color: Color(select ? 0xFF002EA8 : 0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagen),
                Text(
                  texto,
                  style:
                      TextStyle(color: Color(select ? 0xFFFFFFFF : 0xFF000000)),
                ),
              ],
            ),
          ),
          select
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/icons/circle_checkBlue.png",
                    fit: BoxFit.fill,
                    height: 24,
                    width: 24,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
