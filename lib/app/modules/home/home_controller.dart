import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_modular/app/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {


  @action
  logoff() async{
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
