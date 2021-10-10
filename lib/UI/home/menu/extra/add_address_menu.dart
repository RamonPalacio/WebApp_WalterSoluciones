import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'package:walte_soluciones/provider/context/constant/const_state.dart';
import 'package:walte_soluciones/provider/context/main_state.dart';

class AddDirection extends StatelessWidget {
  const AddDirection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainState bState = context.read<MainState>();
    return Row(
      children: [
        InkWell(
          onTap: () async {
            bState.setState(
                id: ConstState.btnidayvuelta,
                texto: !bState.getState(ConstState.btnidayvuelta),
                updateGeneralState: true);
          },
          child: Row(children: [
            Selector<MainState, bool>(
              selector: (_, cState) =>
                  cState.getState(ConstState.btnidayvuelta),
              builder: (_, valueState, __) {
                return Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Color(valueState ? 0xFF2345A1 : 0xFFC0C0C0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              },
            ),
            const SizedBox(width: 6),
            const Text("Ida y Vuelta"),
          ]),
        ),
        const Spacer(),
        SizedBox(
          height: 33,
          width: 200,
          child: Image.asset(
            "assets/icons/addAddress.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
