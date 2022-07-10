import 'package:flutter/material.dart';

import '../config.dart';

class WidgetList {
  static DisplayCenter(BuildContext context, {required List<Widget> children}) {
    return Center(
      child: SingleChildScrollView(
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
      ),
    );
  }

  static Input({TextEditingController? controller, String? Function(String?)? validator, String? hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white54),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            fillColor: MainTheme.light,
            filled: true),
      ),
    );
  }

  static Button({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(MainTheme.accent),
        padding: MaterialStateProperty.all(EdgeInsets.all(12))
      ),
      child: Text(text, style: TextStyle(color: MainTheme.primary)),
    );
  }
}
