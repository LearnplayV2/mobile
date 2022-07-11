import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/components/alert/alerts.dart';
import 'package:learnplay/components/appBar.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/routes.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/services/user/user_service.dart';
import 'package:learnplay/types/requestError.dart';
import 'package:learnplay/types/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginBloc _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }

  checkIsLoggedIn() async {
    if(await Storage.get(Storages.Token) != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(RouteEnum.dashboard.name, (route) => false);
    }
  }

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
            WidgetList.Input(
              hintText: "E-mail",
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Preencha o champo e-mail";
                } else if (!EmailValidator.validate(value)) {
                  return "Preencha um e-mail válido!";
                }
                return null;
              },
            ),
            WidgetList.Input(
                hintText: "********",
                obscureText: true,
                onFieldSubmitted: (value) {
                  _formKey.currentState?.validate();
                },
                controller: password,
                validator: (value) {
                  if (value!.length < 8) {
                    return "A senha deve ter no mínimo 8 caracteres!";
                  }
                  return null;
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Esqueci minha senha",
                      style: TextStyle(color: MainTheme.linkPrimary))),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: WidgetList.Button(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserService.login(
                              User(email: email.text, password: password.text))
                          .then((value) async {
                            checkIsLoggedIn();
                          })
                          .catchError((err) {
                            var error = RequestError.decode(err.toString());
                            Alerts.error(context, title: "Ocorreu um erro", message: "${error.response?.message ?? 'Ocorreu um erro inesperado'}");
                          });
                    }
                  },
                  text: "Entrar",
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      MainTheme.normalText("Não tem uma conta? "),
                      Text("Cadastre-se",
                          style: TextStyle(color: MainTheme.linkPrimary)),
                    ],
                  )),
            ),
          ],
        ),
      )
    ]));
  }
}
