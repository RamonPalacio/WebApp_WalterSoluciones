import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/custom/atoms/img_market.dart';

class Whitebutton extends StatelessWidget {
  const Whitebutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 57,
        width: 210,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE6E7EB))),
        child: SizedBox(
          height: 20,
          child: Row(
            children: [
              const Spacer(),
              const ImgMarker(),
              // SvgPicture.asset(
              //   'assets/icons/location_outline.svg',
              //   height: 18,
              //   width: 14,
              //   fit: BoxFit.fill,
              //   excludeFromSemantics: true,
              // ),
              const Spacer(),
              FittedBox(
                child: Text(
                  'Medellin',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
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
