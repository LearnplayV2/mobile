import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LoginState(user: null)) {
    on<SetUserLoggedIn>(_setUserLoggedIn);
    on<SetProfilePhoto>(_setProfilePhoto);
  }

  void _setUserLoggedIn(
    SetUserLoggedIn event,
    Emitter emit
  ) {
    emit(state.copyWith(user: event.user, profilePhoto: event.user!.uuid));
  }

  void _setProfilePhoto(
    SetProfilePhoto event,
    Emitter emit
  ) {
    emit(state.copyWith(profilePhoto: "${state.profilePhoto}?_=${DateTime.now().millisecondsSinceEpoch}"));
  }
  
}