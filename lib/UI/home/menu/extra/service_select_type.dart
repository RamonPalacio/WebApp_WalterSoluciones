import 'package:flutter/material.dart';
import 'package:walte_soluciones/UI/home/menu/extra/list_services.dart';

class SelectTipoServicio extends StatelessWidget {
  const SelectTipoServicio({
    Key? key,
    required this.sc,
  }) : super(key: key);

  final ScrollController sc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        children: [
          ListView(
            controller: sc,
            scrollDirection: Axis.horizontal,
            children: [
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/doc.png',
                texto: 'Documentos',
                select: true,
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/paquete.png',
                texto: 'Paquete Encargo',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/comprarAlgo.png',
                texto: 'Comprar Algo',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/medicamentos.png',
                texto: 'Medicamentos',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/doc.png',
                texto: 'Documentos2',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/doc.png',
                texto: 'Documentos3',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/doc.png',
                texto: 'Documentos4',
              ),
              const SizedBox(width: 8),
              AccionesMensajero(
                sc: sc,
                imagen: 'assets/icons/doc.png',
                texto: 'Documentos5',
              ),
              const SizedBox(width: 8),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                sc.position.jumpTo(sc.position.pixels - 70);
              },
              child: Image.asset(
                "assets/icons/Arrow2.png",
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                sc.position.jumpTo(sc.position.pixels + 70);
              },
              child: Image.asset(
                "assets/icons/Arrow.png",
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
