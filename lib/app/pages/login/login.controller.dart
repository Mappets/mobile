import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/constants/http.constants.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/constants/shared_preferences.constants.dart';
import 'package:mobile/app/interfaces/user.interface.dart';
import 'package:mobile/app/providers/rest_api.provider.dart';
import 'package:mobile/app/providers/user.provider.dart';
import 'package:mobile/app/widgets/loading/loading.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  UserProvider userProvider = UserProvider.getInstance;
  RestAPIProvider restAPIProvider = RestAPIProvider.getInstance;

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> authenticate(BuildContext context) async {
    if (loginFormKey.currentState.validate()) {
      EasyLoading.show(
          status: '${FlutterI18n.translate(context, "LOADING")}...',
          indicator: LoadingWidget());

      Response<dynamic> authenticateResponse =
          await restAPIProvider.authenticate({
        "email": emailController.text,
        "password": passwordController.text,
      });

      if (authenticateResponse.statusCode == HTTPConstants.OK) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString(SharedPreferencesConstants.USER,
            json.encode(authenticateResponse.data["user"]));

        userProvider.user = User.fromJson(authenticateResponse.data["user"]);

        Get.offAllNamed(RouteConstants.PROFILE);
      }

      EasyLoading.dismiss();
    }
  }
}
