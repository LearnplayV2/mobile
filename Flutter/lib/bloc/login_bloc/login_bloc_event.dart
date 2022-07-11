abstract class LoginEvent {
  const LoginEvent();
}

class SetIsLoggedIn extends LoginEvent {
  final bool isLoggedIn;

  SetIsLoggedIn({required this.isLoggedIn});
}