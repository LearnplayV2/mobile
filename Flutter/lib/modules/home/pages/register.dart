import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:learnplay/components/main_appbar.dart';
import 'package:learnplay/modules/home/pages/home.dart';

import '../../../components/alert/alerts.dart';
import '../../../components/basic_widgets.dart';
import '../../../config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'form_login');

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBar(
      child: SingleChildScrollView(
        child: Column(
          children: [_buildRegister()]
        ),
      )
    );
  }

  _buildRegister() {
    return Container(
      color: MainTheme.secondary,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      margin: (Display.isDesktop())
          ? EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        MainTheme.h1("To do"),
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
                        MainTheme.normalText("Já possui uma conta? "),
                         GestureDetector(
                          onTap: () => Get.to(() => Home()),
                          child: Text("Faça login",
                              style: TextStyle(color: MainTheme.linkPrimary)),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
  
}