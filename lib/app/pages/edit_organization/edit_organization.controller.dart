import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditOrganizationController extends GetxController {
  final organizationFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final addressController = TextEditingController();
  final country = TextEditingController();

  void save(BuildContext context) {
    if (organizationFormKey.currentState.validate()) {
      print("Opa");
    }
  }
}
