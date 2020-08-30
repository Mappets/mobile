import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng> coordinates = Rx<LatLng>();

  /// Carrega a tela de mapa
  @override
  Future<void> onInit() async {
    _loadCurrentPosition();
    super.onInit();
  }

  /// Carrega a localização atual do usuário
  Future<void> _loadCurrentPosition() async {
    Position _currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print("${_currentPosition.latitude}, ${_currentPosition.longitude}");

    coordinates.value =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
  }
}
