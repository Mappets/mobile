import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:mobile/app/constants/http.constants.dart';
import 'package:mobile/app/providers/rest_api.provider.dart';

class RegisterController extends GetxController {
  RestAPIProvider restAPIProvider = RestAPIProvider.getInstance;

  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = MaskedTextController(mask: "+00 (00) 00000-0000");

  Future<void> register() async {
    if (profileFormKey.currentState.validate()) {
      MaskedTextController phoneDataController = MaskedTextController(
          mask: "+0000000000000", text: phoneController.text);

      Response<dynamic> registerResponse = await restAPIProvider.register({
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneDataController.text
      });

      if (registerResponse.statusCode == HTTPConstants.CREATED)
        print(registerResponse.data);
    }
  }
}
