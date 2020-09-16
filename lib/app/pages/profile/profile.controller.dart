import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/providers/user.provider.dart';

class ProfileController extends GetxController {
  UserProvider _userProvider = UserProvider.getInstance;

  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  Future<dynamic> _register() {
    print("Cadastrar usuario");
  }

  Future<dynamic> save() async {
    if (profileFormKey.currentState.validate()) {
      if (_userProvider.user == null)
        await _register();
      else
        await _updateProfile();
    }
  }

  Future<dynamic> _updateProfile() {
    print("Atualizar usuario");
  }
}
