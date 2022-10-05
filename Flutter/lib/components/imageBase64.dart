import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class FileConverter {

  static Uint8List imageFromBase64String(String base64String) {
    String _img = base64String.split(',').last;
    
    return base64.decode(_img);
  }

}
