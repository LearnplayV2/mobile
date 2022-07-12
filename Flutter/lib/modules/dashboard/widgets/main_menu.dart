import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/config.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: MainTheme.lighter,
          child: Row(
            children: [
              _buildLink(text: "Grupos de estudos"),
              _buildLink(text: "Aulas"),
              _buildLink(text: "Artigos"),
              _buildLink(text: "Materiais"),
            ],
          ),
        ),
      ),
    );
  }

  _buildLink({required String text}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: ElevatedButton(
          onPressed: () {
            print(text);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            shadowColor: Colors.transparent,
            primary: Colors.transparent,
            elevation: 0,
          ),
          child: Row(
            children: [
              Text(text, style: TextStyle(fontSize: (Display.isCellphone()) ? 15 : 18)),
            ],
          ),
        ),
      ),
    );
  }
  
}