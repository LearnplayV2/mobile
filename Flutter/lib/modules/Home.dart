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
      SizedBox(height: 30),
      Form(
        key: _formKey,
        child: Column(
          children: [
            WidgetList.Input(),
            WidgetList.Input(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Esqueci minha senha", style: TextStyle(color: MainTheme.linkPrimary))
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
                child: WidgetList.Button(
              onPressed: () {},
              text: "Entrar",
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    MainTheme.normalText("Não tem uma conta? "),
                    Text("Cadastre-se", style: TextStyle(color: MainTheme.linkPrimary))
                  ],
                )
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
