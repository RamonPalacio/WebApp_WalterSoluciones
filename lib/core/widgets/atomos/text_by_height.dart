import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*

TextByHeight(
  'Persona Natural',
  height: 25,
  textstyle: GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    color: const Color(0xFD353B4D),
  ),
),

*/

class TextByHeight extends StatelessWidget {
  final String texto;
  final double height;
  final FontWeight style;
  final Color color;
  final TextAlign textAlign;
  final TextStyle? textstyle;

  const TextByHeight(
    this.texto, {
    Key? key,
    this.height = 26,
    this.style = FontWeight.normal,
    this.color = const Color(0xFF64328A),
    this.textAlign = TextAlign.center,
    this.textstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          texto,
          textAlign: textAlign,
          style: textstyle ??
              GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                color: color,
              ),
        ),
      ),
    );
  }
}
