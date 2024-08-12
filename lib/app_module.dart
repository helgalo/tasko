import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasko/pages/home/home_page.dart';
import 'package:tasko/pages/login/login_page.dart';
import 'package:tasko/pages/register/register_page.dart';
import 'package:tasko/pages/task/create/create_task_page.dart';
import 'package:tasko/pages/task/details/task_details_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
    r.child('/home', child: (context) => const HomePage());
    r.child('/create_task', child: (context) => const CreateTaskPage());
    r.child('/task_details', child: (context) => const TaskDetailsPage());
  }
}
