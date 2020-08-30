import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
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
                onPressed: () => Get.offAllNamed(RouteConstants.PROFILE),
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      );
}
