import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/routes.dart';

import '../../../bloc/login_bloc/login_bloc_event.dart';
import '../../../config.dart';
import '../../../services/storage/storage.dart';
import '../../../services/user/user_service.dart';
import '../core/auth_controller.dart';

class DashboardBar extends StatefulWidget {
  final Widget child;

  DashboardBar({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardBar> createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {

  @override
  void initState() {
    super.initState();
    AuthController.userCheck(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.primary,
      drawer: Drawer(
        backgroundColor: MainTheme.secondary,
        child: ListView(
          children: [
            SizedBox(height: 30),
            _buildMenuItem(context,
                title: "Página Inicial", route: RouteEnum.dashboard.name),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: MainTheme.secondary,
        actions: [
          SizedBox(
            width: 30,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteEnum.dashboardProfile.name);
                  },
                  child: ProfilePicture(
                    name: "${state.user?.name}", 
                    radius: 31, 
                    img: "${UserService.getProfilePicture(uuid: state.user!.uuid!)}",
                    fontsize: 15,
                  ),
                );
              }
            ),
          ),
          SizedBox(width: 15)
        ],
        title: Text(title, style: TextStyle(color: MainTheme.accent)),
      ),
      body: widget.child,
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required String title, required String route}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
