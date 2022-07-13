import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';

import '../config.dart';

class ImageController {
  static Future<FormData?> uploadByCellphone() async {
    final _picker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (_picker != null) {
      final image = File(_picker.path); 
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, contentType: new MediaType("image", "png")),
      });
      return formData;
     
    }
  }

  static Future<FormData?> uploadByDesktop() async {
    final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
    final PickedFile? image =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, contentType: new MediaType("image", "png")),
      });
      return formData;
    }
  }
}
