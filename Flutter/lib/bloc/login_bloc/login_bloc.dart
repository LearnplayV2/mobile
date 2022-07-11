import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LoginState(user: null)) {
    on<SetUserLoggedIn>(_setUserLoggedIn);
  }

  void _setUserLoggedIn(
    SetUserLoggedIn event,
    Emitter emit
  ) {
    emit(state.copyWith(user: event.user));
  }
  
}