//import 'package:db_projeto/app/config/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile_univesp_pi3/app/config/routes.dart';
import 'package:mobile_univesp_pi3/app/config/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext constext) {
    return MaterialApp.router(
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,

      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
    );
  }
}
