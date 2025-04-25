import 'package:flutter/material.dart';
import 'package:studexa/features/learning/ui/learning_page.dart';
import '../features/home/ui/home_page.dart';
import '../features/auth/ui/login_page.dart';
import '../pages/profile_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/login':
       return MaterialPageRoute(builder: (_) => const LoginPage());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      case '/learn':
        return MaterialPageRoute(builder: (_) => const LearningPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
