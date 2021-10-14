import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InformaciondeRuta extends StatelessWidget {
  const InformaciondeRuta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.white,
        height: 117,
        width: 480,
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/servicemoney.svg",
                  height: 64,
                  fit: BoxFit.fitHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distancia',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFD002EA8),
                      ),
                    ),
                    Text(
                      '2 Km',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFD002EA8),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/servicecar.svg",
                  height: 64,
                  fit: BoxFit.fitHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor a Pagar',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFD002EA8),
                      ),
                    ),
                    Text(
                      '\$ 7.200',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFD002EA8),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
