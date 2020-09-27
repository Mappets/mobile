import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:mobile/app/widgets/popup_menu_button/popup_menu_button.controller.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  final PopupMenuButtonController controller =
      Get.put(PopupMenuButtonController());

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      offset: Offset(0, -130),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor),
        child: Icon(Icons.pets, color: Theme.of(context).accentColor),
      ),
      itemBuilder: (BuildContext context) => controller.popupMenuOptions
          .asMap()
          .entries
          .map((MapEntry option) => PopupMenuItem(
                value: option.key,
                child:
                    Text(FlutterI18n.translate(context, option.value["label"])),
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ))
          .toList(),
      color: Theme.of(context).primaryColor,
      onSelected: controller.onSelectPopupMenuOption);
}
