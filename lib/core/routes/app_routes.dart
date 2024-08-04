import 'package:chef_app/features/auth/presentation/views/login_view.dart';
import 'package:chef_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:chef_app/features/auth/presentation/views/send_code_view.dart';
import 'package:chef_app/features/home/presentation/views/home_view.dart';
import 'package:chef_app/features/menu/presentation/views/menu_view.dart';
import 'package:chef_app/features/profile/presentation/views/profile_view.dart';
import 'package:chef_app/features/splash/presentation/views/change_lang_view.dart';
import 'package:chef_app/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String changLan = '/changLan';
  static const String sendCode = '/sendCode';
  static const String resetPassw = '/resetPassw';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String menu = '/menu';
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
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.menu:
        return MaterialPageRoute(builder: (_) => const MenuView());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
