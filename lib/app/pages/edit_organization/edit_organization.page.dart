import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/title/title.widget.dart';

import 'edit_organization.controller.dart';

class EditOrganizationPage extends StatelessWidget {
  final EditOrganizationController controller =
      Get.put(EditOrganizationController());

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save, color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => controller.save(context),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ));

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.all(48),
        child: ListView(
          children: [
            TitleWidget(
                prefix: Padding(
                  padding: EdgeInsets.only(right: 17),
                  child: Image.asset(
                    "assets/images/home.png",
                  ),
                ),
                title: "NEW_ORGANIZATION"),
            DividerWidget(),
            _registerForm(context),
          ],
        ),
      );

  Widget _registerForm(BuildContext context) => Form(
      key: controller.organizationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameInput(context),
          _typeInput(context),
          Divider(
            height: 40,
          ),
          TitleWidget(title: "ADDRESS"),
          _addressInput(context),
          _countryInput(context),
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

  Widget _typeInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.typeController,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "AGE"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            return null;
          },
        ),
      );

  Widget _addressInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
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
        ),
      );

  Widget _countryInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.country,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "COUNTRY"),
          ),
          validator: (value) {
            if (value.isEmpty)
              return FlutterI18n.translate(context, "REQUIRED_FIELD");

            return null;
          },
        ),
      );
}
