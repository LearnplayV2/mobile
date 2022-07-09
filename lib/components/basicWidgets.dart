import 'package:flutter/material.dart';

import '../config.dart';

class WidgetList {
  static DisplayCenter(BuildContext context, {required List<Widget> children}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              color: MainTheme.secondary,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )),
        ],
      ),
    );
  }

  static Input() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          ),
          fillColor: MainTheme.light,
          filled: true
        ),
      ),
    );
  }
}
