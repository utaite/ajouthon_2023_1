import 'package:get/get.dart';

import 'splash_page_controller.dart';
import 'splash_page_model.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashPageController>(SplashPageController(
      model: SplashPageModel.empty(),
    ));
  }
}
