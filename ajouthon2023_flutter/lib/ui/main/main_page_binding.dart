import 'package:ajouthon2023/constant/pref_helper.dart';
import 'package:get/get.dart';

import 'main_page_controller.dart';
import 'main_page_model.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<MainPageController>(() async {
      return MainPageController(
        model: MainPageModel.empty().copyWith(
          courses: {},
        ),
      );
    });
  }
}
