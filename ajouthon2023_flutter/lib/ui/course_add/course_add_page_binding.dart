import 'package:get/get.dart';

import '../../constant/api.dart';
import '../../constant/util.dart';
import '../../model/course/course_model.dart';
import 'course_add_page_controller.dart';
import 'course_add_page_model.dart';

class CourseAddPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseAddPageController>(CourseAddPageController(
      model: (() {
        final courses = argumentMap<int, List<CourseModel>>();

        return CourseAddPageModel.empty().copyWith(
          grade: argument(),
          checkedCourses: Map.fromEntries([
            ...List.generate(8, (i) => i).map((x) => MapEntry(x, courses?[x]?.map((y) => y.name) ?? [])),
          ]),
          departmentList: departmentList,
        );
      })(),
    ));
  }
}
