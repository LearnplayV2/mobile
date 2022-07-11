import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/routes.dart';

import '../../../config.dart';
import '../../../services/storage/storage.dart';

class DashboardBar extends StatelessWidget {
  final Widget child;

  const DashboardBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.primary,
      drawer: Drawer(
        backgroundColor: MainTheme.secondary,
        child: ListView(
          children: [
            _buildMenuItem(context, title: "Página Inicial", route: RouteEnum.dashboard.name),
            _buildLogoutItem(context)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: MainTheme.secondary,
        title: Text(title, style: TextStyle(color: MainTheme.accent)),
      ),
      body: child,
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
