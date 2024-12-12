import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<File?> pickImage() {
    return getImage(ImageSource.gallery);
  }

  static Future<File?> captureImage() {
    return getImage(ImageSource.camera);
  }

  static Future<File?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: source);
    return image != null ? File(image.path) : null;
  }
}
