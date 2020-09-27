import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';
import 'package:mobile/app/pages/disconnected/disconnected.page.dart';
import 'package:mobile/app/pages/edit_pet/edit_pet.page.dart';
import 'package:mobile/app/pages/login/login.page.dart';
import 'package:mobile/app/pages/map/map.page.dart';
import 'package:mobile/app/pages/profile/profile.page.dart';
import 'package:mobile/app/pages/register/register.page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RouteConstants.MAP,
    page: () => MapPage(),
  ),
  GetPage(
    name: RouteConstants.DISCONNECTED,
    page: () => DisconnectedPage(),
  ),
  GetPage(
    name: RouteConstants.LOGIN,
    page: () => LoginPage(),
  ),
  GetPage(
    name: RouteConstants.REGISTER,
    page: () => RegisterPage(),
  ),
  GetPage(
    name: RouteConstants.PROFILE,
    page: () => ProfilePage(),
  ),
  GetPage(
    name: RouteConstants.EDIT_PET,
    page: () => EditPetPage(),
  ),
];
