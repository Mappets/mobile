import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map.controller.dart';

class MapPage extends StatelessWidget {
  final MapController controller = Get.put(MapController());

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/images/launch_image.png",
              width: 150,
            ),
            brightness: Brightness.dark),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.78,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Obx(() => controller.coordinates.value != null
                ? GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: controller.coordinates.value,
                      zoom: 17,
                    ),
                    onMapCreated: (controller) => print(controller))
                : Container()),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Create',
          elevation: 2.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.pets, color: Theme.of(context).accentColor),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
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
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: IconButton(
                  icon: Icon(Icons.person, size: 30),
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
        ),
      );
}
