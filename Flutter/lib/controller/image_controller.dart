import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';

import '../config.dart';

class ImageController {
  static Future<File?> uploadByCellphone() async {
    final _picker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (_picker != null) {
      final image = File(_picker.path); 
      return image;
    }
  }

  static Future<PickedFile?> uploadByDesktop() async {
    final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
    final PickedFile? image =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image;
    }
  }
}
