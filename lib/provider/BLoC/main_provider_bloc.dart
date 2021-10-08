import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/BLoC/registro_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/signin_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/sms_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/utility_bloc_mixin.dart';

enum clickEvents { editar, medellin, bogota, mexico }

class MainBLoC extends ChangeNotifier
    with SignInBloc, RegisrtoBloc, SmsBloc, Utility {}
