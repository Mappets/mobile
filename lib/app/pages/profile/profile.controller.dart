import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  GlobalKey profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
}
