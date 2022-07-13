import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/controller/loading_controller.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/services/user/user_service.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile({Key? key}) : super(key: key);

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

class _DashboardProfileState extends State<DashboardProfile> {
  LoadingController _loadingController = Get.put(LoadingController());
  
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
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                    width: (Display.isCellphone()) 
                    ? MediaQuery.of(context).size.height * .2 
                    : MediaQuery.of(context).size.height * .2,
                    height: (Display.isCellphone()) 
                    ? MediaQuery.of(context).size.height * .2
                    : MediaQuery.of(context).size.height * .2,
                    child: (userState.user != null)
                        ? Image.network(UserService.getProfilePicture(
                            uuid: userState.profilePhoto!))
                        : Image.asset("assets/default-avatar.jpg")),
                (Display.isDesktop()) ? SizedBox(height: 12) : Container(),
                ElevatedButton(
                    onPressed: () {
                      _loadingController.setIsLoading(RxBool(true));
                      UserService().changeProfilePicture(context)
                        .then((value) async => {
                          _loadingController.setIsLoading(RxBool(false))
                        });
                    }, child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.photo_camera),
                          SizedBox(width: 8),
                          Text("Mudar imagem"),
                        ],
                      ),
                    )),
                SizedBox(height: 25),
                Text("${userState.user?.name}", style: TextStyle(fontSize: 28)),
                SizedBox(height: 14),
                Container(
                  color: MainTheme.lighter,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text("Ativo desde ${DateFormat('dd/MM/yyyy, kk:mm').format(DateTime.parse(userState.user?.createdAt ?? DateTime.now().toString()))}")
                )
              ],
            ),
          ),
        ]);
      }),
    );
  }
}
