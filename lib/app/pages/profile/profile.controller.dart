import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:mobile/app/interfaces/user.interface.dart';
import 'package:mobile/app/providers/user.provider.dart';

class ProfileController extends GetxController {
  UserProvider userProvider = UserProvider.getInstance;

  Rx<User> user;

  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthDateController = MaskedTextController(mask: '00/00/0000');
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    user = userProvider.user.obs;
    nameController.text = user.value.name;
  }
}
