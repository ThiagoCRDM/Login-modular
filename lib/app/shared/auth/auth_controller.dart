import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_modular/app/shared/repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser user;

  @observable
  AuthStatus status = AuthStatus.loading;

  _AuthControllerBase(){
    _authRepository.getUser().then(setUser);
  }

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
    
  }

  @action
  Future loginWithGoogle() async{
    user = await _authRepository.getGoogleLogin();
  }

  @action
  Future logOut(){
    return _authRepository.getLogOut();
  }
  
}

enum AuthStatus{
  loading, login, logoff
}