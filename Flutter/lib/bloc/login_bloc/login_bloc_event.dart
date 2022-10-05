import 'package:learnplay/types/user.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class SetUserLoggedIn extends LoginEvent {
  final User? user;
  
  SetUserLoggedIn({required this.user});
}

class SetProfilePhoto extends LoginEvent {
  SetProfilePhoto();
}