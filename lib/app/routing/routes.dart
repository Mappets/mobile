import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/pages/home/home.page.dart';
import 'package:mobile/app/pages/map/map.page.dart';
import 'package:mobile/app/pages/register/register.page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RouteConstants.MAP,
    page: () => MapPage(),
  ),
  GetPage(
    name: RouteConstants.REGISTER,
    page: () => RegisterPage(),
  ),
  GetPage(
    name: RouteConstants.HOME,
    page: () => HomePage(),
  )
];
