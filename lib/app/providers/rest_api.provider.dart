import 'package:dio/dio.dart';
import 'package:mobile/app/constants/rest_api.constants.dart';

class RestAPIProvider {
  static RestAPIProvider instance;
  String bearerToken;
  final Dio dio = Dio(BaseOptions(
    baseUrl: RestAPIConstants.BASE_URL,
  ));

  static get getInstance {
    if (instance == null) instance = RestAPIProvider();

    return instance;
  }

  Future<dynamic> authenticate() => dio.get("");

  void setToken(String token) => bearerToken = token;
}
