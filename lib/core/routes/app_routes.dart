import 'package:chef_app/features/auth/presentation/views/login_view.dart';
import 'package:chef_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:chef_app/features/auth/presentation/views/send_code_view.dart';
import 'package:chef_app/features/splash/presentation/views/change_lang_view.dart';
import 'package:chef_app/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String changLan = '/changLan';
  static const String sendCode = '/sendCode';
  static const String resetPassw = '/resetPassw';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.changLan:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeView());
      case Routes.resetPassw:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
