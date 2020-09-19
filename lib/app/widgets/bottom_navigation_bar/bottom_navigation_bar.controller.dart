import 'package:get/get.dart';
import 'package:mobile/app/interfaces/user.interface.dart';
import 'package:mobile/app/providers/user.provider.dart';

class BottomNavigationBarController extends GetxController {
  UserProvider userProvider = UserProvider.getInstance;

  Rx<User> user;

  @override
  void onInit() {
    super.onInit();
    user = userProvider.user.obs;
  }
}
