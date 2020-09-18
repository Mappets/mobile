import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/title/title.widget.dart';

import 'register.controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/images/launch_image.png",
              width: 150,
            ),
            brightness: Brightness.dark),
        body: _body(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save, color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: controller.register,
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      );

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.all(48),
        child: ListView(
          children: [
            TitleWidget(title: "REGISTER"),
            DividerWidget(),
            _registerForm(context),
          ],
        ),
      );

  Widget _registerForm(BuildContext context) => Form(
      key: controller.profileFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameInput(context),
          _emailInput(context),
          _phoneInput(context),
          _passwordInput(context),
          _confirmPasswordInput(context),
        ],
      ));

  Widget _nameInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.nameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "NAME"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            return null;
          },
        ),
      );

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

  Widget _phoneInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "PHONE"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

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

            if (value != controller.confirmPasswordController.text)
              return FlutterI18n.translate(context, "DIFFERENT_PASSWORDS");

            return null;
          },
        ),
      );

  Widget _confirmPasswordInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "CONFIRM_PASSWORD"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            if (value != controller.passwordController.text)
              return FlutterI18n.translate(context, "DIFFERENT_PASSWORDS");

            return null;
          },
        ),
      );
}
