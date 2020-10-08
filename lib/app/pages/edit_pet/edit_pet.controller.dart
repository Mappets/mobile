import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera_camera/camera_camera.dart';

class EditPetController extends GetxController {
  final petFormKey = GlobalKey<FormState>();
  RxString petImage;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final country = TextEditingController();

  Future<void> openCamera(BuildContext context) async {
    try {
      File file = await Get.to(Camera());

      if (file != null) petImage.value = file.path;
    } catch (error) {
      print(error);
    }
  }

  void save(BuildContext context) {
    if (petFormKey.currentState.validate()) {
      print("Opa");
    }
  }
}
