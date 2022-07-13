import 'package:learnplay/types/user.dart';

class LoginState {
  User? user;
  String? profilePhoto;

  LoginState({this.user, this.profilePhoto});

  LoginState copyWith({
    User? user,
    String? profilePhoto
  }) {
    return LoginState(
      user: user ?? this.user,
      profilePhoto: profilePhoto ?? this.profilePhoto
    );
  }
  
}