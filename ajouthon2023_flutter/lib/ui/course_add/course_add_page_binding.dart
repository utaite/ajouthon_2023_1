import 'package:get/get.dart';

import '../../constant/api.dart';
import '../../constant/util.dart';
import 'course_add_page_controller.dart';
import 'course_add_page_model.dart';

class CourseAddPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseAddPageController>(CourseAddPageController(
      model: CourseAddPageModel.empty().copyWith(
        already: arguments(),
        departmentList: departmentList,
      ),
    ));
  }
}
