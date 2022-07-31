import 'dart:io';

import 'package:flutter/material.dart';

import '../config.dart';

class WidgetList {
  static DisplayCenter(BuildContext context, {required List<Widget> children}) {
    return Flexible(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: (constraints.maxWidth > 900) ? Alignment.center : Alignment.topCenter,
            child: Container(
                constraints: BoxConstraints(
                  minHeight: (constraints.maxWidth > 600) ? 500 : 0
                ),
                color: MainTheme.secondary,
                width: (Display.isDesktop())
                    ? MediaQuery.of(context).size.width * .6
                    : MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                )),
          );
        }
      ),
    );
  }

  static Input(
      {TextEditingController? controller,
      String? Function(String?)? validator,
      String? hintText,
      TextInputType? keyboardType,
      bool? obscureText,
      TextInputAction? textInputAction,
      Function(String value)? onFieldSubmitted,
      VoidCallback? onEditingComplete}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscureText ?? false,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        style: TextStyle(color: Colors.white),
        validator: validator,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
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

  static Button(
      {required VoidCallback onPressed,
      String? text,
      Widget? content,
      Color? textColor,
      Color? backgroundColor}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all<Color>(backgroundColor)
              : MaterialStateProperty.all<Color>(MainTheme.accent),
          padding: (Display.isDesktop())
              ? MaterialStateProperty.all(EdgeInsets.all(20))
              : MaterialStateProperty.all(EdgeInsets.all(12))),
      child: content ??
          Text(text!,
              style: TextStyle(
                color: textColor ?? MainTheme.primary,
                fontSize: (Display.isDesktop()) ? 18 : 16,
              )),
    );
  }
}
