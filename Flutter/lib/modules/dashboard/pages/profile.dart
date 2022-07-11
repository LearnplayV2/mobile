import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile({Key? key}) : super(key: key);

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

class _DashboardProfileState extends State<DashboardProfile> {
  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: Text("Meu perfil"),
    );
  }
}