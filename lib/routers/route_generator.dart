import 'package:app_base_flutter/common/log_utils.dart';
import 'package:app_base_flutter/screens/policy_screen/policy.dart';
import 'package:app_base_flutter/screens/splash_screen/splash_screen_logo_app.dart';
import 'package:app_base_flutter/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String policy = 'policy_screen';
  static const String welcomeScreen = 'welcome_screen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        logWithColor("MÀN HÌNH HIỆN TẠI: $settings.name", brightYellow);
        return MaterialPageRoute(
          maintainState: false,
          builder: (context) => const SplashScreenLogoApp(),
          settings: settings,
        );
      case policy:
        logWithColor("MÀN HÌNH HIỆN TẠI: $settings.name", brightYellow);
        return MaterialPageRoute(
          maintainState: true,
          builder: (context) => PolicyScreen(),
          settings: settings,
        );
      case welcomeScreen:
        logWithColor("MÀN HÌNH HIỆN TẠI: $settings.name", brightYellow);
        return MaterialPageRoute(
          maintainState: true,
          builder: (context) => const WelcomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
          settings: settings,
        );
    }
  }
}
