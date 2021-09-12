// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walte_soluciones/custom/atoms/img_check.dart';
import 'package:walte_soluciones/custom/molecules/TextboxW.dart';
import 'package:walte_soluciones/custom/atoms/img_info.dart';
import 'package:walte_soluciones/custom/molecules/btnblancox.dart';
import 'package:walte_soluciones/home/maps.dart';
import 'package:walte_soluciones/home/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xFF000000),
      debugShowCheckedModeBanner: false,
      title: 'Pedidos Walter',
      theme: ThemeData(primarySwatch: Colors.blue
          //     const MaterialColor(0xFF002EA8, {1: Color(0xFF002EA8)}),
          ),
      home: const MainApp(),
    );
  }
}

var boxDecoration = BoxDecoration(
  color: const Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(30),
  boxShadow: const <BoxShadow>[
    BoxShadow(
        color: Color(0x52474747), blurRadius: 24.0, offset: Offset(0.0, 12.0))
  ],
);

var elevatedButton = ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: const Color(0xFFEEEEEE), // background
    onPrimary: const Color(0xFF000000), // foreground
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  onPressed: () {},
  child: Row(
    children: [
      const Spacer(),
      Image.asset("/icons/makerblue.png"),
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
);

class BlueButton extends StatelessWidget {
  final String text;
  const BlueButton({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF002EA8), // background

        onPrimary: const Color(0xFF000000), // foreground

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: LayoutBuilder(builder: (c, hw) {
          return Column(
            children: [
              SizedBox(
                height: 65,
                child:
                    Text("maxheight:${hw.maxHeight} maxWidth:${hw.maxWidth}"),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 56,
                      child: SizedBox(
                        height: 65,
                        width: 196,
                        child: Image.asset("icons/Logo.png"),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: SizedBox(
                        // height: 50,
                        // width: 300,
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 200,
                              child: Whitebutton(),
                            ),
                            SizedBox(width: hw.maxWidth * 0.01),
                            const SizedBox(
                                height: 50,
                                width: 200,
                                child: BlueButton(text: 'Inicia Sección'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  // Separador inferior
                  height: 51,
                  color: const Color(0xFFFFFFFF)),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: const Color(0xFFFFFFFF),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: Menu(),
                        ),
                        Expanded(
                          flex: 2,
                          child: GoogleMap(),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        }),
      ),
    );
  }
}

class AtributosEnvio extends StatelessWidget {
  const AtributosEnvio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 168,
      width: double.infinity,
      // color: const Color(0xFFFFFFFF),
      decoration: boxDecoration,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFED6C1D),
                  border: Border.all(width: 3.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: const Text("B",
                    style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: TextBoxW(
                    iconPre: Padding(
                      padding: EdgeInsets.only(
                          left: 18, right: 10, top: 18, bottom: 18),
                      child: Img(color: 0xFF002EA8, size: 1),
                    ),
                    texto: "Carrera 66 # 48 - 63",
                    textoBase: "Ingresar dirección o sitio",
                    iconPos: Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 18, top: 18, bottom: 18),
                      child: ImgCheck(color: 0xFF002EA8, size: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: TextBoxW(
              iconPre: Padding(
                padding:
                    EdgeInsets.only(left: 18, right: 10, top: 18, bottom: 18),
                child: Img(color: 0xFF002EA8, size: 1),
              ),
              texto: "Entregar documentos",
              textoBase: "¿Qué debe hacer tu asistente en esta dirección?",
              iconPos: Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 18, top: 18, bottom: 18),
                child: ImgCheck(color: 0xFF002EA8, size: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Mapa extends StatelessWidget {
  const Mapa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "icons/phone.svg",
      fit: BoxFit.fitHeight,
      height: 50,
      // color: Colors.red,
      // cacheColorFilter: true,
      // colorBlendMode: BlendMode.color,
    );
  }
}

class BlueButtons extends StatelessWidget {
  const BlueButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // color: const Color(0xFF002EA8),
        height: 57,
        width: 210,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF002EA8),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          'Inicia Sesión',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFFFFF),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
