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

class DashboardBar extends StatefulWidget {
  final Widget child;

  DashboardBar({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardBar> createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {

  final _loginBloc = LoginBloc();
  
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
            _builProfileItem(context),
            _buildLogoutItem(context)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: MainTheme.secondary,
        title: Text(title, style: TextStyle(color: MainTheme.accent)),
      ),
      body: widget.child,
    );
  }

  Widget _builProfileItem(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context, state) {  },
      child: ListTile(
        title: Text("Meu perfil"),
        onTap: () {
          Navigator.of(context).pushNamed(RouteEnum.dashboardProfile.name);
        },
      ),
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return ListTile(
      title: Text("Sair"),
      onTap: () {
        Storage.remove(Storages.Token);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
      },
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
