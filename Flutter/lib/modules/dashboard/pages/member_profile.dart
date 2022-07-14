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
import 'package:learnplay/modules/dashboard/pages/profile.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/services/user/user_service.dart';
import 'package:learnplay/types/user.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class DashboardMemberProfile extends StatefulWidget {
  const DashboardMemberProfile({Key? key}) : super(key: key);

  @override
  State<DashboardMemberProfile> createState() => _DashboardMemberProfileState();
}

class _DashboardMemberProfileState extends State<DashboardMemberProfile> {
  LoadingController _loadingController = Get.put(LoadingController());
  
  User? _member = null;

  @override
  void initState() {
    super.initState();
    _checkIsYourProfile();
    _getMemberProfileInfo();
  }

  _checkIsYourProfile() async {
    final session = await Storage.getSavedSession();
    if(session.uuid == Get.arguments['uuid']) Get.off(() => DashboardProfile());
  }

  _getMemberProfileInfo() async {
    final response = await UserService.getMember(uuid: Get.arguments['uuid']);
    _member = response;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if(_member == null) return Container(child: Text("carregando..."));

    return DashboardBar(
      child: WidgetList.DisplayCenter(context, children: [
          MainTheme.h1("Perfil de ${_member!.name}", color: MainTheme.accent),
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
                    child: (_member != null)
                        ? Image.network(UserService.getProfilePicture(
                            uuid: _member!.uuid!))
                        : Image.asset("assets/default-avatar.jpg")),
                (Display.isDesktop()) ? SizedBox(height: 12) : Container(),
                SizedBox(height: 25),
                Text("${_member!.name}", style: TextStyle(fontSize: 28)),
                SizedBox(height: 14),
                Container(
                    color: MainTheme.lighter,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                        "Ativo desde ${DateFormat('dd/MM/yyyy, kk:mm').format(DateTime.parse(_member!.createdAt ?? DateTime.now().toString()))}"))
              ],
            ),
          ),
        ]),
    );
  }
}