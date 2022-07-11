import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LoginState(isLoggedIn: false)) {
    on<SetIsLoggedIn>(_setIsLoggedIn);
  }

  void _setIsLoggedIn(
    SetIsLoggedIn event,
    Emitter emit
  ) {
    emit(state.copyWith(isLoggedIn: event.isLoggedIn));
  }
  
}