import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  var counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
  
}