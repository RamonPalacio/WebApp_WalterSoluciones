import 'package:flutter/material.dart';

/* Ejemplo


BotonGradiane(
text: "+",
padingLeft: 20,
padingRight: 20,
onPressed: () {},
height: 46,
width: 200,
colorUp: 0xFF3EF738,
colorDown: 0xFF00973A,
iconPre: Text("Pre"),
iconPos: Text("Pos"),
enable: true,
child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Pegadito"),
    Icon(Icons.ac_unit_outlined),
  ],
),
),


*/

class BotonGradiane extends StatelessWidget {
  final String text;
  final Color colortext;
  final double padingLeft;
  final double padingRight;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final int colorUp;
  final int colorDown;
  final dynamic iconPre;
  final dynamic iconPos;
  final bool enable;
  final dynamic child;
  final double border;
  final int? borderColor;
  final Alignment alingText;
  final double fontsize;

  const BotonGradiane({
    Key? key,
    this.text = "",
    this.fontsize = 0,
    this.onPressed,
    this.width = 100,
    this.height = 50,
    this.colorUp = 0xFD22B473,
    this.colorDown = 0xFD177E5F,
    this.iconPre = "",
    this.iconPos = "",
    this.enable = true,
    this.padingLeft = 20,
    this.padingRight = 20,
    this.child,
    this.border = 50,
    this.borderColor,
    this.colortext = const Color(0xFFFFFFFF),
    this.alingText = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("iconPre " + iconPre);
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
                border: Border.all(
                    width: borderColor == null ? 0 : 2,
                    color: Color(borderColor ?? 0xFFFFFFFF)),
                gradient: LinearGradient(
                  colors: [Color(colorUp), Color(colorDown)],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(border)),
            child: Stack(
              children: [
                Container(
                  alignment: alingText,
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: (iconPre == "" ? 0 : 40) + padingLeft,
                    right: (iconPos == "" ? 0 : 40) + padingRight,
                    top: fontsize,
                    bottom: fontsize,
                  ),
                  child: child ??
                      FittedBox(
                        child: Text(
                          text,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: colortext, fontSize: 200),
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Row(
                      children: [
                        iconPre == "" ? const SizedBox() : iconPre,
                        const Spacer(),
                        iconPos == "" ? const SizedBox() : iconPos,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
