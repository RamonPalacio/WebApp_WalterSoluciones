import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/txt_state_name.dart';

class TxtControllersState extends ChangeNotifier {
  final TextEditingController _txtDirprincipal = TextEditingController();

  TextEditingController getControladorTxt(nameControler) {
    switch (nameControler) {
      case TxtStateName.txtDirprincipal:
        return _txtDirprincipal;
      default:
        return TextEditingController();
    }
  }
}
