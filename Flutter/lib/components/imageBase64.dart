import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class FileConverter {

  static Uint8List imageFromBase64String(String base64String) {
    String _img = base64String.split(',').last;
    
    return base64.decode(_img);
  }

  static String fileToBase64({required String path}) {
    final file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
  }

}
