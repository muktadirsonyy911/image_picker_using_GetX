import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_using_getx/controller.dart';

class MyHomePage extends StatelessWidget {
  final ImageController _imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Pick Image'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return _imageController.selectedImagePath.value == ''
                  ? Text('No image selected')
                  : Image.file(File(_imageController.selectedImagePath.value));
            }),
            ElevatedButton(
                onPressed: () {
                  _imageController.getImage(ImageSource.camera);
                },
                child: Text('Camera')),
            ElevatedButton(
                onPressed: () {
                  _imageController.getImage(ImageSource.gallery);
                },
                child: Text('Gallery')),
          ],
        ),
      ),
    ));
  }
}
