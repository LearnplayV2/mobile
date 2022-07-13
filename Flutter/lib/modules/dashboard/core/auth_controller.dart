import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnplay/types/user.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../bloc/login_bloc/login_bloc_event.dart';
import '../../../routes.dart';
import '../../../services/user/user_service.dart';

class AuthController {

  static void setUserLoggedIn(BuildContext context, {User? user}) {
    return BlocProvider.of<LoginBloc>(context).add(SetUserLoggedIn(user: user));
  }

  static void reloadProfilePhoto(BuildContext context) {
    return BlocProvider.of<LoginBloc>(context).add(SetProfilePhoto());
  }

  static userCheck(BuildContext context) async {
    var user = await UserService.checkUserLoggedIn(context);
    if (user != null) {
      AuthController.setUserLoggedIn(context, user: user);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
    }
  }
  
}
