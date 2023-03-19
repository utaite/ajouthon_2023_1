import 'package:get/get.dart';

import '../../constant/api.dart';
import 'intro_page_controller.dart';
import 'intro_page_model.dart';

class IntroPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroPageController>(IntroPageController(
      model: IntroPageModel.empty().copyWith(
        departmentList: departmentList.toList(),
        majorList: majorList.toList(),
      ),
    ));
  }
}
