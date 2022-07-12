import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/config.dart';

class TopButton extends StatelessWidget {
  final ScrollController scrollController;
  
  const TopButton({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
              }, 
              backgroundColor: MainTheme.accent,
              child: Icon(Icons.keyboard_arrow_up, color: Colors.white)
          )
      ),
    );
  }
}
