import 'dart:math';

import 'package:ajouthon2023/constant/util.dart';
import 'package:get/get.dart';

import 'check_page_controller.dart';
import 'check_page_model.dart';

class CheckPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckPageController>(CheckPageController(
      model: (() {
        final grade = argument<int>(tag: 'grade') ?? 3;

        return CheckPageModel.empty().copyWith(
          grade: grade,
          currentGrade: min(1, grade),
          checkedCourses: Map.fromEntries([
            ...List.generate(grade, (i) => i).map((x) => MapEntry(x, [])),
          ]),
          department: argument(tag: 'department') ?? 0,
          pluralMajor: argument(tag: 'pluralMajor') ?? 1,
          subDepartment: argument(tag: 'subDepartment') ?? 2,
          departmentList: arguments() ?? ['소프트웨어학과', '융합시스템공학과', '불어불문학과'],
        );
      })(),
    ));
  }
}
