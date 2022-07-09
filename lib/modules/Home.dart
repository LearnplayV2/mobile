import 'package:flutter/material.dart';
import 'package:learnplay/components/appBar.dart';
import 'package:learnplay/components/basicWidgets.dart';
import 'package:learnplay/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MainBar(
        child: WidgetList.DisplayCenter(context, children: [
      MainTheme.h1("Fazer Login"),
      Form(
        key: _formKey,
        child: Column(
          children: [WidgetList.Input(), WidgetList.Input()],
        ),
      )
    ]));
  }
}
