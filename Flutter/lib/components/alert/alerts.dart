import 'package:flutter/material.dart';

import '../../config.dart';

class Alerts {

  static void error(BuildContext context, {required String title, required String message}) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: MainTheme.secondary,
          title: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 10),
              Text(title, style: TextStyle(color: Colors.white)),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(message),
              ),
            ]),
          ),
        );
      });
  }
  
}