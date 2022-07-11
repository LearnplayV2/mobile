import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardIndex extends StatefulWidget {
  const DashboardIndex({Key? key}) : super(key: key);

  @override
  State<DashboardIndex> createState() => _DashboardIndexState();
}

class _DashboardIndexState extends State<DashboardIndex> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("welcome dashboard"),
    );
  }
}