import 'dart:math';

import 'package:ajouthon2023/constant/util.dart';
import 'package:get/get.dart';

import '../../constant/api.dart';
import '../../constant/extension.dart';
import 'check_page_controller.dart';
import 'check_page_model.dart';

class CheckPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckPageController>(CheckPageController(
      model: (() {
        final iterable = arguments<int>().elvis;
        final grade = iterable.firstOrNull.elvis + 1;

        return CheckPageModel.empty().copyWith(
          grade: grade,
          currentGrade: min(1, grade.elvis),
          checkedCourses: Map.fromEntries([
            ...List.generate(grade.elvis, (i) => i).map((x) => MapEntry(x, [])),
          ]),
          department: iterable.secondOrNull,
          pluralMajor: iterable.thirdOrNull,
          subDepartment: iterable.fourthOrNull,
          departmentList: departmentList,
        );
      })(),
    ));
  }
}
