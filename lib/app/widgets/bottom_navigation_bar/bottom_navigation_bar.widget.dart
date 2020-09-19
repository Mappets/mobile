import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/widgets/bottom_navigation_bar/bottom_navigation_bar.controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: IconButton(
                icon: Icon(Icons.home, size: 30),
                color: Theme.of(context).accentColor,
                onPressed: () => Get.offAllNamed(RouteConstants.MAP),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: IconButton(
                icon: Icon(Icons.person, size: 30),
                color: Theme.of(context).accentColor,
                onPressed: () => Get.offAllNamed(controller.user.value != null
                    ? RouteConstants.PROFILE
                    : RouteConstants.DISCONNECTED),
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      );
}
