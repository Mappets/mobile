import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map.controller.dart';

class MapPage extends GetWidget<MapController> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: MapController(),
            builder: (MapController controller) => Center(
              child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: controller.coordinates.value,
                    zoom: 17,
                  ),
                  onMapCreated: (controller) => print(controller)),
            ),
          )));
}
