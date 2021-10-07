import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/custom/atoms/img_market.dart';

class Whitebutton extends StatelessWidget {
  const Whitebutton({
    Key? key,
    this.text = "",
    this.events,
  }) : super(key: key);

  final String text;
  final VoidCallback? events;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: events,
      child: Container(
        height: 57,
        width: 300,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE6E7EB))),
        child: SizedBox(
          height: 20,
          child: Row(
            children: [
              const SizedBox(width: 20),
              const ImgMarker(color: 0xFF002EA8),
              // SvgPicture.asset(
              //   'assets/icons/location_outline.svg',
              //   height: 18,
              //   width: 14,
              //   fit: BoxFit.fill,
              //   excludeFromSemantics: true,
              // ),
              const SizedBox(width: 20),
              FittedBox(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF002EA8),
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(flex: 5),
              FittedBox(
                child: Text(
                  '>',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF002EA8),
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
