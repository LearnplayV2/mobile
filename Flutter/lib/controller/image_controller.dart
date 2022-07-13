import 'package:file_picker/file_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';

import '../config.dart';

class ImageController {
  static Future<PlatformFile?> uploadByCellphone() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image);

    if (image != null) {
      PlatformFile file = image.files.first;
      return file;
    }
  }

  static Future<PickedFile?> uploadByDesktop() async {
    final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
    final PickedFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      return image;
    }
    
  }
}
