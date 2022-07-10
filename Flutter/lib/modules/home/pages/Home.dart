import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/counter_bloc/counter_bloc.dart';
import 'package:learnplay/bloc/counter_bloc/counter_event.dart';
import 'package:learnplay/components/appBar.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _counterBloc = CounterBloc();

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
            ),
            WidgetList.Input(hintText: "********"),
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
                  onPressed: () { },
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
                      BlocBuilder(
                        bloc: _counterBloc,
                        builder: (ctx, state) {
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _counterBloc.add(IncrementCounterEvent());
                                }, 
                                child: Text("increment")
                              ),
                              Text("${_counterBloc.state.count}", style: TextStyle(color: MainTheme.linkPrimary)),
                            ],
                          );
                        }
                      )
                    ],
                  )),
            ),
          ],
        ),
      )
    ]));
  }
}
