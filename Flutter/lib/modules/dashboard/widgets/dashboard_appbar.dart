import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/components/imageBase64.dart';
import 'package:learnplay/components/main_appbar.dart';
import 'package:learnplay/controller/loading_controller.dart';
import 'package:learnplay/modules/core/notifications_controller.dart';
import 'package:learnplay/modules/dashboard/pages/index.dart';
import 'package:learnplay/modules/dashboard/pages/notifications/notifications.dart';
import 'package:learnplay/modules/dashboard/pages/profile.dart';
import 'package:learnplay/modules/dashboard/widgets/load_content.dart';
import 'package:learnplay/modules/dashboard/widgets/main_menu.dart';
import 'package:learnplay/modules/dashboard/widgets/notification_center.dart';
import 'package:learnplay/modules/dashboard/widgets/top_button.dart';
import 'package:learnplay/routes.dart';
import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/socket/socket.dart';
import 'package:learnplay/services/user/notification_service.dart';
import 'package:learnplay/types/user.dart';

import '../../../bloc/login_bloc/login_bloc_event.dart';
import '../../../config.dart';
import '../../../services/storage/storage.dart';
import '../../../services/user/user_service.dart';
import '../../core/auth_controller.dart';

class DashboardBar extends StatefulWidget {
  final Widget child;

  DashboardBar({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardBar> createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {
  ScrollController _scrollController = ScrollController();
  bool _activateTopButton = false;
  final _notificationsController = Get.put(NotificationsController());

  @override
  void initState() {
    super.initState();
    AuthController.userCheck(context);
    WebsocketServer.connectAndListen();
    _scrollController.addListener(_scrollListener);
    _notifications();
  }
  
  _notifications() async {
    _notificationsController
        .setNotifications(await NotificationService.getNotifications());
  }

  _scrollListener() {
    if (_scrollController.offset >= 50) {
      _activateTopButton = true;
    } else {
      _activateTopButton = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state.user != null) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: MainTheme.primary,
                floatingActionButton: (!_activateTopButton)
                    ? null
                    : TopButton(scrollController: _scrollController),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: MainTheme.secondary,
                  titleSpacing: 0,
                  title: Row(
                    children: [
                      SizedBox(width: 12),
                      IconButton(
                          onPressed: () => Get.off(() => DashboardIndex()),
                          icon: Icon(Icons.home, color: MainTheme.white)),
                      SizedBox(width: 15),
                      Text(title, style: TextStyle(color: MainTheme.accent)),
                    ],
                  ),
                  actions: [
                    ..._spacing(NotificationCenter(
                        notificationsController: _notificationsController)),
                    _buildProfilePicture(),
                    SizedBox(width: 15)
                  ],
                ),
                body: Column(
                  children: [
                    MainMenu(), 
                    widget.child
                  ],
                )),
            _buildBackButtonForDesktop(),
            LoadContent()
          ],
        );
      }

      return MainBar(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDoubleBounce(
                color: Colors.white,
                size: 50.0,
              ),
              SizedBox(height: 18),
              _buildAnimatedLoading(),
            ],
          ),
        ),
      );
    });
  }


  _buildBackButtonForDesktop() {
    return Visibility(
      visible: Display.isDesktop() && !Display.isWeb() && Navigator.of(context).canPop(),
      child: Positioned(
          bottom: 15,
          left: 15,
          child: SizedBox(
            width: 30,
            height: 30,
            child: FloatingActionButton(
              backgroundColor: MainTheme.lighter,
              onPressed: () => Navigator.of(context).maybePop(),
              child: Icon(Icons.arrow_back, size: 16),
            ),
          )),
    );
  }

  _buildAnimatedLoading() {
    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText(
          "Carregando",
          textStyle: TextStyle(fontSize: 20),
        ),
      ],
      isRepeatingAnimation: true,
    );
  }

  _spacing(Widget widget) {
    return [widget, SizedBox(width: 15)];
  }

  _buildProfilePicture() {
    return SizedBox(
      width: 30,
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return ElevatedButton(
          onPressed: () => Get.to(() => DashboardProfile()),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.transparent,
              padding: EdgeInsets.zero,
              shadowColor: Colors.transparent),
          child: (state.user?.userItems?.photo != null)  
            ? Container(
              child: imageFromBase64String(state.user!.userItems!.photo!),
            )
            : Text(state.user!.name![0]) 
        );
      }),
    );
  }

  
}
