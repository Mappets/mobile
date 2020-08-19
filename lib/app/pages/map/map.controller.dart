import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng> coordinates = Rx<LatLng>();

  @override
  Future<void> onInit() async {
    Position _currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    coordinates.value =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
    super.onInit();
  }
}
