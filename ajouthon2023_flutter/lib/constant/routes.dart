import 'package:get/get.dart';

import '../ui/course_add/course_add_page.dart';
import '../ui/course_add/course_add_page_binding.dart';
import '../ui/course_list/course_list_page.dart';
import '../ui/course_list/course_list_page_binding.dart';
import '../ui/main/main_page.dart';
import '../ui/main/main_page_binding.dart';
import 'extension.dart';

enum Routes {
  empty,
  main,
  courseList,
  courseAdd,
}

final Map<Routes, MapEntry<WidgetFunc, Bindings?>> pages = {
  Routes.main: MapEntry(() => const MainPage(), MainPageBinding()),
  Routes.courseList: MapEntry(() => const CourseListPage(), CourseListPageBinding()),
  Routes.courseAdd: MapEntry(() => const CourseAddPage(), CourseAddPageBinding()),
};
