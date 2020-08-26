import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/pages/map/map.page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RouteConstants.MAP,
    page: () => MapPage(),
  ),
];
