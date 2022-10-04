import 'dart:convert';

import 'package:flutter/material.dart';

Image imageFromBase64String(String base64String) {
  String _img = base64String.split(',').last;
  
  return Image.memory(base64.decode(_img));
}
