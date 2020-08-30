import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/popup_menu_button/popup_menu_button.widget.dart';

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
        body: Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PopupMenuButtonWidget(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      );
}
