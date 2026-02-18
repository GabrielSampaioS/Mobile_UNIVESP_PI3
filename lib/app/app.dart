import 'package:flutter/material.dart';
import 'package:mobile_univesp_pi3/app/config/routes.dart';
import 'package:mobile_univesp_pi3/app/config/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter();

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
    );
  }
}
