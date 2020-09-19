import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:mobile/app/constants/http.constants.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/constants/shared_preferences.constants.dart';
import 'package:mobile/app/interfaces/user.interface.dart';
import 'package:mobile/app/providers/rest_api.provider.dart';
import 'package:mobile/app/providers/user.provider.dart';
import 'package:mobile/app/widgets/loading/loading.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  UserProvider userProvider = UserProvider.getInstance;
  RestAPIProvider restAPIProvider = RestAPIProvider.getInstance;

  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = MaskedTextController(
    mask: "+00 (00) 00000-0000",
  );

  Future<void> _authenticate(String email, String password) async {
    Response<dynamic> authenticateResponse =
        await restAPIProvider.authenticate({
      "email": email,
      "password": password,
    });

    if (authenticateResponse.statusCode == HTTPConstants.OK) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(SharedPreferencesConstants.USER,
          json.encode(authenticateResponse.data["user"]));

      userProvider.user = User.fromJson(authenticateResponse.data["user"]);

      Get.offAllNamed(RouteConstants.PROFILE);
    }
  }

  Future<void> register(BuildContext context) async {
    EasyLoading.show(
        status: '${FlutterI18n.translate(context, "LOADING")}...',
        indicator: LoadingWidget());

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
        await _authenticate(emailController.text, passwordController.text);
    }

    EasyLoading.dismiss();
  }
}
