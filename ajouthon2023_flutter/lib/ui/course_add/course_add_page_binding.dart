import 'package:get/get.dart';

import 'course_add_page_controller.dart';
import 'course_add_page_model.dart';

class CourseAddPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseAddPageController>(CourseAddPageController(
      model: CourseAddPageModel.empty(),
    ));
  }
}
