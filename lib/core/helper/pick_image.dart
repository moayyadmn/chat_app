import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImage {
  final ImagePicker picker = ImagePicker();
  File? file;
  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
    }
    return file;
  }
}
