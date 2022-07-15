import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnplay/modules/core/notifications_controller.dart';

import '../../../config.dart';
import '../pages/notifications.dart';

class NotificationCenter extends StatelessWidget {

  final NotificationsController notificationsController;
  
  const NotificationCenter({Key? key, required this.notificationsController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx( () => notificationsController.notifications.value.where((notification) => notification!.read != false).isEmpty  ? _notificationIcon() : _buildNotificationBadge());
  }

  _buildNotificationBadge() {
    return Badge(
      badgeContent: Text(
          "${notificationsController.notifications.value.where((notification) => notification!.read != false).length}",
          style: GoogleFonts.lato(color: Colors.white),
        ),
      position: BadgePosition.topEnd(
          top: 15, end: (Display.isCellphone()) ? -1 : -3),
      child: _notificationIcon(),
    );
  }

  _notificationIcon() {
    return IconButton(
        onPressed: () => Get.to(() => DashboardNotifications()),
        icon: Icon(Icons.notifications_none, color: MainTheme.white, size: 28));
  }
}
