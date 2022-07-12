import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../bloc/login_bloc/login_bloc_event.dart';
import '../../../routes.dart';
import '../../../services/user/user_service.dart';

class AuthController {
  static userCheck(BuildContext context) async {
    var user = await UserService.checkUserLoggedIn(context);
    if (user != null) {
      Future.delayed(Duration(milliseconds: 2000), () => BlocProvider.of<LoginBloc>(context).add(SetUserLoggedIn(user: user)));
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
    }
  }
}
