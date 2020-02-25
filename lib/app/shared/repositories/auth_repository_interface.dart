
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository{

  Future<FirebaseUser> getUser();
  
  Future<FirebaseUser> getGoogleLogin();
  
  Future getFacebookLogin();

  Future getEmailPasswordLogin();

  Future<String> getToken();

  Future getLogOut();
}