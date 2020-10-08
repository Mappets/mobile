import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/pages/edit_pet/edit_pet.controller.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/title/title.widget.dart';

class EditPetPage extends StatelessWidget {
  final EditPetController controller = Get.put(EditPetController());

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
                    "assets/images/dog.png",
                  ),
                ),
                title: "NEW_PET"),
            DividerWidget(),
            _registerForm(context),
          ],
        ),
      );

  Widget _registerForm(BuildContext context) => Form(
      key: controller.petFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _petImage(context),
          _nameInput(context),
          _ageInput(context),
          _genderInput(context),
          Divider(
            height: 40,
          ),
          TitleWidget(title: "ADDRESS"),
          _addressInput(context),
          _countryInput(context),
        ],
      ));

  Widget _petImage(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(25),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: controller.petImage != null
                    ? Container()
                    : Container(
                        child: Icon(
                          Icons.camera_alt,
                          size: 100,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
              ),
              onTap: () => controller.openCamera(context),
            )
          ],
        ),
      );

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

  Widget _ageInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.ageController,
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

  Widget _genderInput(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextFormField(
          controller: controller.genderController,
          decoration: InputDecoration(
            labelText: FlutterI18n.translate(context, "GENDER"),
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
