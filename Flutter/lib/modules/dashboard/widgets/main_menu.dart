import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/pages/members.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        color: MainTheme.lighter,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildLink(text: "Grupos de estudos"),
              _buildLink(text: "Aulas"),
              _buildLink(text: "Artigos"),
              _buildLink(text: "Materiais"),
              _buildLink(text: "Membros", onPressed: () => Get.to(() => DashboardMembers())),
            ],
          ),
        ),
      ),
    );
  }

  _buildLink({required String text, VoidCallback? onPressed}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: ElevatedButton(
          onPressed: onPressed ?? () {
            print(text);
          },
          style: ElevatedButton.styleFrom(
            padding: (Display.isDesktop()) ? 
              EdgeInsets.all(20)
              :
              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            shadowColor: Colors.transparent,
            primary: Colors.transparent,
            elevation: 0,
          ),
          child: Row(
            children: [
              Text(text,
                  style:
                      TextStyle(fontSize: (Display.isCellphone()) ? 15 : 18, color: MainTheme.white)),
            ],
          ),
        ),
      ),
    );
  }
}
