import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/provider/BLoC/main_provider_bloc.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

class ResultadoDirecciones extends StatelessWidget {
  const ResultadoDirecciones({
    Key? key,
    required this.txtStateName,
    required this.dirListPrediction,
    required this.marker,
  }) : super(key: key);

  final String txtStateName;
  final String dirListPrediction;
  final String marker;

  @override
  Widget build(BuildContext context) {
    Function clickCard = context.read<MainBLoC>().updatetxtubication;

    return Consumer<MainState>(
      builder: (c, mainState, _) {
        int totalItems = (mainState.getState(dirListPrediction) as List).length;

        return ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Container(
            // margin: const EdgeInsets.only(left: 6, right: 6),
            color: const Color(0x00F1F1F1),
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: totalItems,
              itemExtent: 40,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    clickCard(context, dirListPrediction, index, txtStateName,
                        marker);
                  },
                  child: FadeInLeft(
                    preferences: AnimationPreferences(
                        offset: Duration(milliseconds: index * 100)),
                    child: Card(
                      color: const Color(0xFFF5F5F5),
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FittedBox(
                          child: Text(mainState
                              .getState(dirListPrediction)[index][0]
                              .toString()),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
