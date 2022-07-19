import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class DashboardGroups extends StatefulWidget {
  const DashboardGroups({Key? key}) : super(key: key);

  @override
  State<DashboardGroups> createState() => _DashboardGroupsState();
}

class _DashboardGroupsState extends State<DashboardGroups> {
  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: WidgetList.DisplayCenter(
        context, 
        children: [
          MainTheme.h1("Grupos de estudo", color: MainTheme.accent),
          SizedBox(height: 20),
        ]
      )
    );
  }
}