import 'package:apps/home.dart';
import 'package:apps/utils/routes/routes_name.dart';
import 'package:apps/view/biometric_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    final argum = settings.arguments;
    switch (settings.name) {
      case Routesname.biometricautheticatepage:
        return MaterialPageRoute(
            builder: (BuildContext context) => biometric());
      case Routesname.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: const Text('no routes defined'),
            ),
          );
        });
    }
  }
}
