import 'package:get/get.dart';

import '../ui/check/check_page.dart';
import '../ui/check/check_page_binding.dart';
import '../ui/course_add/course_add_page.dart';
import '../ui/course_add/course_add_page_binding.dart';
import '../ui/course_list/course_list_page.dart';
import '../ui/course_list/course_list_page_binding.dart';
import '../ui/intro/intro_page.dart';
import '../ui/intro/intro_page_binding.dart';
import '../ui/main/main_page.dart';
import '../ui/main/main_page_binding.dart';
import '../ui/splash/splash_page.dart';
import '../ui/splash/splash_page_binding.dart';
import 'extension.dart';

enum Routes {
  empty,
  splash,
  main,
  courseList,
  courseAdd,
  intro,
  check,
}

final Map<Routes, MapEntry<WidgetFunc, Bindings?>> pages = {
  Routes.splash: MapEntry(() => const SplashPage(), SplashPageBinding()),
  Routes.main: MapEntry(() => const MainPage(), MainPageBinding()),
  Routes.courseList: MapEntry(() => const CourseListPage(), CourseListPageBinding()),
  Routes.courseAdd: MapEntry(() => const CourseAddPage(), CourseAddPageBinding()),
  Routes.intro: MapEntry(() => const IntroPage(), IntroPageBinding()),
  Routes.check: MapEntry(() => const CheckPage(), CheckPageBinding()),
};
