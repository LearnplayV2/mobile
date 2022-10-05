import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/services/user/user_service.dart';
import 'package:learnplay/types/user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LoginState(user: null)) {
    on<SetUserLoggedIn>(_setUserLoggedIn);
    on<SetProfilePhoto>(_setProfilePhoto);
  }

  void _setUserLoggedIn(
    SetUserLoggedIn event,
    Emitter emit
  ) {
    emit(state.copyWith(user: event.user));
  }

  void _setProfilePhoto(
    SetProfilePhoto event,
    Emitter emit
  ) async {
    try {

      final data = await UserService.getUserItems();
      var user = state.user;
      user?.userItems = data;

      emit(state.copyWith(user: user));

    } catch(err) {
      print(err);
    }
    
  }
  
}