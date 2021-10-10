import 'package:flutter/material.dart';
import 'package:walte_soluciones/provider/logic/include/mixin_registro.dart';
import 'package:walte_soluciones/provider/logic/include/mixin_signin.dart';
import 'package:walte_soluciones/provider/logic/include/mixin_sms.dart';
import 'package:walte_soluciones/provider/logic/include/mixin_utility.dart';

import 'include/mixin_menu.dart';

// enum clickEvents { editar, medellin, bogota, mexico }

class MainBLoC extends ChangeNotifier
    with SignInBloc, RegisrtoBloc, SmsBloc, MenuBloc, Utility {}
