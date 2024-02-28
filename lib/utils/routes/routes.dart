import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/view/home_view.dart';
import 'package:mvvm_provider/view/login_view.dart';
import 'package:mvvm_provider/view/register_view.dart';
import 'package:mvvm_provider/view/splash_view.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => const registerView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined...'),
            ),
          );
        });
    }
  }
}
