import 'package:flutter/material.dart';
import 'package:learnplay/config.dart';

class MainBar extends StatelessWidget {

  const MainBar({Key? key, required Widget this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return (Display.isDesktop()) ? Scaffold(
      body: child,
    ) : Scaffold(
      backgroundColor: MainTheme.primary,
      appBar: AppBar(
        backgroundColor: MainTheme.secondary,
        title: Center(child: Text(title, style: TextStyle(color: MainTheme.accent))),
      ),
      body: child,
    );
  }
}
