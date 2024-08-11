import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasko/pages/home/home_page.dart';
import 'package:tasko/pages/login/login_page.dart';
import 'package:tasko/pages/register/register_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LoginPage(),
    );
    r.child(
      '/register',
      child: (context) => const RegisterPage(),
    );
    r.child(
      '/home',
      child: (context) => const HomePage(),
    );
  }
}
