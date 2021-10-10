import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/context/constant/const_txt_state_name.dart';

class TxtControllersState extends ChangeNotifier {
  final TextEditingController _txtDirprincipal = TextEditingController();
  final TextEditingController _txtDirSecundario = TextEditingController();
  final TextEditingController _txtTamano = TextEditingController();
  final TextEditingController _txtDeclarado = TextEditingController();

  TextEditingController getControladorTxt(nameControler) {
    switch (nameControler) {
      case TxtStateName.txtDirprincipal:
        return _txtDirprincipal;
      case TxtStateName.txtDirsecundario:
        return _txtDirSecundario;
      case TxtStateName.txtTamano:
        return _txtTamano;
      case TxtStateName.txtDeclarado:
        return _txtDeclarado;

      default:
        return TextEditingController();
    }
  }
}
