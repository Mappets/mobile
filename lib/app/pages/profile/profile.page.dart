import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:mobile/app/widgets/divider/divider.widget.dart';
import 'package:mobile/app/widgets/popup_menu_button/popup_menu_button.widget.dart';
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
        floatingActionButton: PopupMenuButtonWidget(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      );

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.all(48),
        child: ListView(
          children: [
            TitleWidget(title: "PROFILE"),
            DividerWidget(),
            _registerContent(context)
          ],
        ),
      );

  Widget _registerContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 42),
            child: Text(
              FlutterI18n.translate(context, "NEED_SIGNIN_MESSAGE"),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: TitleWidget(title: "REGISTER"),
          ),
          DividerWidget(),
          _actionButton(context, "SIGN_UP", () {}),
          Padding(
            padding: EdgeInsets.only(top: 69),
            child: TitleWidget(title: "SIGN_IN"),
          ),
          DividerWidget(),
          _actionButton(context, "SIGN_IN", () {})
        ],
      );

  Widget _actionButton(BuildContext context, String text, Function onPressed) =>
      Container(
        margin: EdgeInsets.only(top: 14),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            FlutterI18n.translate(context, text),
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).accentColor),
          ),
          onPressed: onPressed,
        ),
      );
}
