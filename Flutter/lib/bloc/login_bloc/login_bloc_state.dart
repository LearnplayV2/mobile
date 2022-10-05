import 'package:learnplay/types/user.dart';

class LoginState {
  User? user;

  LoginState({this.user});

  LoginState copyWith({
    User? user,
  }) {
    return LoginState(
      user: user ?? this.user,
    );
  }
  
}