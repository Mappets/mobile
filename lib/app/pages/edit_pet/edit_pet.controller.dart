import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPetController extends GetxController {
  final petFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final country = TextEditingController();

  void save(BuildContext context) {
    if (petFormKey.currentState.validate()) {
      print("Opa");
    }
  }
}
