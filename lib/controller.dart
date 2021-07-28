import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  RxString selectedImagePath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: imageSource,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
    }
  }
}
