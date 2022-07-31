import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_event.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/routes.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/services/user/user_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class DashboardIndex extends StatefulWidget {
  const DashboardIndex({Key? key}) : super(key: key);

  @override
  State<DashboardIndex> createState() => _DashboardIndexState();
}

class _DashboardIndexState extends State<DashboardIndex> {
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());
    return DashboardBar(
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return WidgetList.DisplayCenter(context, children: [
          MainTheme.h1("Bem-vindo(a) de volta!", color: MainTheme.accent),
          SizedBox(height: 20),
          Visibility(
              visible: state.user != null,
              child: Container(
                  child: SelectableText(
                      "${state.user!.name}, você é membro faz ${timeago.format(DateTime.parse(state.user!.createdAt!), locale: 'pt_BR')}!"))),
          Text("resume to do...")
        ]);
      }),
    );
  }
}
