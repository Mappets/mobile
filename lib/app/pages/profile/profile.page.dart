import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/title/title.widget.dart';

import 'profile.controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

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
          onPressed: controller.save,
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      );

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.all(48),
        child: ListView(
          children: [
            TitleWidget(title: "PROFILE"),
            DividerWidget(),
            _profileContent(context),
          ],
        ),
      );

  Widget _profileContent(BuildContext context) => Form(
      key: controller.profileFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameInput(context),
          _birthDateInput(context),
          _passwordInput(context),
          Padding(
            padding: EdgeInsets.only(top: 42),
            child: TitleWidget(title: "ADDRESS"),
          ),
          DividerWidget(),
          _addressInput(context),
          _countryInput(context),
        ],
      ));

  Widget _nameInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 42),
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

  Widget _birthDateInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.birthDateController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "BIRTH_DATE"),
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

            return null;
          },
        ),
      );

  Widget _addressInput(BuildContext context) => Padding(
      padding: EdgeInsets.only(top: 42),
      child: TextFormField(
        controller: controller.addressController,
        decoration: InputDecoration(
          labelText: FlutterI18n.translate(context, "ADDRESS"),
        ),
        validator: (value) {
          if (value.isEmpty)
            return FlutterI18n.translate(context, "REQUIRED_FIELD");

          return null;
        },
      ));

  Widget _countryInput(BuildContext context) => Padding(
      padding: EdgeInsets.only(top: 14),
      child: TextFormField(
        controller: controller.countryController,
        decoration: InputDecoration(
          labelText: FlutterI18n.translate(context, "COUNTRY"),
        ),
        validator: (value) {
          if (value.isEmpty)
            return FlutterI18n.translate(context, "REQUIRED_FIELD");

          return null;
        },
      ));
}
