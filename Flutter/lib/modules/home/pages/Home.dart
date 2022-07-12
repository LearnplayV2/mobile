import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/components/alert/alerts.dart';
import 'package:learnplay/components/main_appbar.dart';
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
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'form_login');

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }

  checkIsLoggedIn() async {
    if (await Storage.get(Storages.Token) != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteEnum.dashboard.name, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainBar(
        child: SingleChildScrollView(
      child: Column(
        children: [
          _buildPresentation(),
          SizedBox(height: 50),
          _buildLogin(),
          SizedBox(height: 50)
        ],
      ),
    ));
  }

  _buildPresentation() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 22),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainTheme.h1("A plataforma do ",
                    size: (Display.isDesktop()) ? 30 : 20),
                MainTheme.h1("Conhecimento ",
                    color: MainTheme.accent,
                    size: (Display.isDesktop()) ? 30 : 20),
              ],
            ),
          ),
          SizedBox(height: 22),
          Image.asset(
            'assets/img1.png',
            fit: BoxFit.contain,
            width: 150,
          ),
          SizedBox(height: 30),
          Container(
              margin: (Display.isDesktop())
                  ? EdgeInsets.symmetric(horizontal: 8)
                  : EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                  "Somos uma comunidade que compartilha conhecimento: acesse grupos de estudo, compartilhe artigos e aulas.\nNão fique de fora!",
                  style: TextStyle(fontSize: (Display.isDesktop()) ? 22 : 14)))
        ],
      ),
    );
  }

  _buildLogin() {
    return Container(
      color: MainTheme.secondary,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      margin: (Display.isDesktop())
          ? EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: WidgetList.Button(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        UserService.login(User(
                                email: email.text, password: password.text))
                            .then((value) async {
                          checkIsLoggedIn();
                        }).catchError((err) {
                          var error = RequestError.decode(err.toString());
                          Alerts.error(context,
                              title: "Ocorreu um erro",
                              message:
                                  "${error.response?.message ?? 'Ocorreu um erro inesperado'}");
                        });
                      }
                    },
                    text: "Entrar",
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
