import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc_mixin/registro_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc_mixin/signin_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc_mixin/sms_mixin.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc_mixin/utility_bloc_mixin.dart';

import 'main_provider_bloc_mixin/menu_mixin.dart';

enum clickEvents { editar, medellin, bogota, mexico }

class MainBLoC extends ChangeNotifier
    with SignInBloc, RegisrtoBloc, SmsBloc, MenuBloc, Utility {}
