import 'package:get/get.dart';
import 'package:mobile/app/constants/route.constants.dart';

class PopupMenuButtonController extends GetxController {
  List<Map<String, dynamic>> popupMenuOptions = [
    {
      "label": "NEW_PET_LABEL",
      "action": () => Get.toNamed(RouteConstants.EDIT_PET)
    },
    {
      "label": "NEW_ORGANIZATION_LABEL",
      "action": () => Get.toNamed(RouteConstants.EDIT_PET)
    },
  ];

  void onSelectPopupMenuOption(dynamic index) =>
      popupMenuOptions[index]["action"]();
}
