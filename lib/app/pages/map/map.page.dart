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
            "assets/images/brand-white.png",
            width: 150,
          ),
          brightness: Brightness.dark),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
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
      ));
}
