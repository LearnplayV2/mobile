import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/modules/dashboard/core/auth_controller.dart';
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
  @override
  void initState() {
    super.initState();
    AuthController.userInterceptor(context);
  }

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, snapshot) {
            return Text("welcome ${snapshot.user?.name}");
          }),
    );
  }
}
