import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class FileConverter {

  static Uint8List imageFromBase64String(String base64String) {
    String _img = base64String.split(',').last;
    
    return base64.decode(_img);
  }

  static String uint8ListToBase64(Uint8List uint8list) {
    String base64String = base64Encode(uint8list);
    String header = "data:image/png;base64,";
    return header + base64String;
  }

}
