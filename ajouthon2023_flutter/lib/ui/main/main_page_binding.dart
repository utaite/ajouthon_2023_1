import 'package:get/get.dart';

import '../../constant/api.dart';
import 'main_page_controller.dart';
import 'main_page_model.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController(
      model: MainPageModel.empty().copyWith(
        collegeList: collegeList,
        departmentList: departmentList,
        majorList: majorList,
      ),
    ));
  }
}
