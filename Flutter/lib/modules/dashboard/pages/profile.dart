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
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .3,
                    child: (userState.user != null)
                        ? Image.network(UserService.getProfilePicture(
                            uuid: userState.profilePhoto!))
                        : Image.asset("assets/default-avatar.jpg")),
                SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () => UserService().changeProfilePicture(context), child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.photo_camera),
                          SizedBox(width: 8),
                          Text("Mudar imagem"),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ]);
      }),
    );
  }
}
