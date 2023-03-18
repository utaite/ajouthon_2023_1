import 'package:get/get.dart';

import '../../constant/api.dart';
import 'course_list_page_controller.dart';
import 'course_list_page_model.dart';

class CourseListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseListPageController>(CourseListPageController(
      model: CourseListPageModel.empty().copyWith(
        departmentList: departmentList,
      ),
    ));
  }
}
