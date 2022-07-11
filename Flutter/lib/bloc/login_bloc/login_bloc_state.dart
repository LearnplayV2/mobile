class LoginState {
  bool isLoggedIn;

  LoginState({required this.isLoggedIn});

  LoginState copyWith({
    bool? isLoggedIn,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}