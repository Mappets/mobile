import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/pages/home/home.page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RouteConstants.HOME,
    page: () => HomePage(),
  )
];
