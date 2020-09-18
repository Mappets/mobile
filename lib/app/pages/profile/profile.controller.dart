import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthDateController = MaskedTextController(mask: '00/00/0000');
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
}
