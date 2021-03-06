import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walte_soluciones/provider/state/txt_controllers_state.dart';

import 'router/routers.dart';
import 'core/constant/app_settings.dart';
import 'provider/state/main_state.dart';
import 'provider/logic/main_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      //States
      ChangeNotifierProvider(create: (_) => MainState()),
      ChangeNotifierProvider(create: (_) => TxtControllersState()),
      //Eventos BLoC
      ChangeNotifierProvider(create: (_) => MainBLoC()),
    ],
    child: const MainApp(),
    // Matis()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color(0xFF000000),
      title: AppSettings.appDisplayName,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: homeRoute,
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
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0x52474747),
              blurRadius: 24.0,
              offset: Offset(0.0, 12.0))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 43,
                width: 43,
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
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
