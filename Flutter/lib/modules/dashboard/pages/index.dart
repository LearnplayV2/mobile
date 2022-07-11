import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/routes.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/services/user/user_service.dart';

class DashboardIndex extends StatefulWidget {
  const DashboardIndex({Key? key}) : super(key: key);

  @override
  State<DashboardIndex> createState() => _DashboardIndexState();
}

class _DashboardIndexState extends State<DashboardIndex> {
  final LoginBloc _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    userInterceptor();
  }

  userInterceptor() async {
    var user = await UserService.checkUserLoggedIn(context);
    if (user != null) {
      _loginBloc.add(SetUserLoggedIn(user: user));
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, snapshot) {
            return Text("welcome ${_loginBloc.state.user?.email}");
          }),
    );
  }
}
