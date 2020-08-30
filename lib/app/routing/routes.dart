import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/pages/map/map.page.dart';
import 'package:mobile/app/pages/profile/profile.page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RouteConstants.MAP,
    page: () => MapPage(),
  ),
  GetPage(
    name: RouteConstants.PROFILE,
    page: () => ProfilePage(),
  ),
];
