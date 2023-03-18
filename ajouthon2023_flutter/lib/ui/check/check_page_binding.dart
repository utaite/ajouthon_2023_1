import 'package:get/get.dart';

import 'check_page_controller.dart';
import 'check_page_model.dart';

class CheckPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckPageController>(CheckPageController(
      model: CheckPageModel.empty(),
    ));
  }
}
