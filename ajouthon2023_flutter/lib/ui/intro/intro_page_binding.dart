import 'package:get/get.dart';

import 'intro_page_controller.dart';
import 'intro_page_model.dart';

class IntroPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroPageController>(IntroPageController(
      model: IntroPageModel.empty().copyWith(
        departmentList: ["소프트웨어학과", "불어불문학과", "융합시스템공학과"],
        majorList: ["복수전공", "부전공"],
      ),
    ));
  }
}
