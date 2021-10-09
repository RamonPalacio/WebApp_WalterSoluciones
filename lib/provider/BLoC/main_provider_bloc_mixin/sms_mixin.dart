import 'package:flutter/material.dart';
import 'package:walte_soluciones/constant/pages_show_state.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

abstract class SmsBloc {
  clickOTPResend(BuildContext context) {
    context.read<MainBLoC>().resetPop(context);
    context.read<MainState>().setState(
          id: PagesShowState.reotpshow,
          texto: true,
          updateGeneralState: true,
        );
  }

  clickRegistroOTP(BuildContext context) {
    context.read<MainState>().setState(
          id: PagesShowState.otpshow,
          texto: true,
          updateGeneralState: true,
        );
  }
}
