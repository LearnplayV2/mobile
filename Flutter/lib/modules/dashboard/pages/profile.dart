import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/services/user/user_service.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile({Key? key}) : super(key: key);

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

class _DashboardProfileState extends State<DashboardProfile> {
  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, userState) {
        return WidgetList.DisplayCenter(context, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTheme.h1("Meu perfil", color: MainTheme.accent),
              WidgetList.Button(
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => UserService.logout(context),
                  content: Row(
                    children: [
                      Icon(Icons.input),
                      SizedBox(width: 10),
                      Text("Sair"),
                    ],
                  ))
            ],
          ),
          SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
                child: CircleAvatar(
                    radius: (52),
                    backgroundColor: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: (userState.user != null) 
                      ? Image.network(UserService.getProfilePicture(uuid: userState.user!.uuid!))
                      : Image.asset("assets/default-avatar.jpg")
                    ))),
          ),
          Text("aaaaaaaaaaa"),
          Text("aaaaaaaaaaa"),
          Text("aaaaaaaaaaa"),
          Text("aaaaaaaaaaa")
        ]);
      }),
    );
  }
}
