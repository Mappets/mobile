import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/title/title.widget.dart';

import 'login.controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(context) => FlutterEasyLoading(
          child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/images/launch_image.png",
              width: 150,
            ),
            brightness: Brightness.dark),
        body: _body(context),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ));

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.all(48),
        child: ListView(
          children: [
            TitleWidget(title: "SIGN_IN"),
            DividerWidget(),
            _registerForm(context),
          ],
        ),
      );

  Widget _registerForm(BuildContext context) => Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _emailInput(context),
          _passwordInput(context),
          _signInButton(context)
        ],
      ));

  Widget _emailInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "EMAIL"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            if (!value.isEmail)
              return FlutterI18n.translate(context, "INVALID_EMAIL");

            return null;
          },
        ),
      );

  Widget _passwordInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "PASSWORD"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            return null;
          },
        ),
      );

  Widget _signInButton(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              FlutterI18n.translate(context, "SIGN_IN"),
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            onPressed: () => controller.authenticate(context),
          ),
        ),
      );
}
