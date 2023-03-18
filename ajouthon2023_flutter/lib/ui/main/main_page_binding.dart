import 'package:get/get.dart';

import '../../model/course/course_model.dart';
import 'main_page_controller.dart';
import 'main_page_model.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController(
      model: MainPageModel.empty().copyWith(
        courses: {
          '2023-1학기 수강과목': [
            CourseModel.empty().copyWith(
              name: '운영체제',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '컴퓨터통신',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '생명과학',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '자료구조',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '객체지향프로그래밍실습',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '글쓰기',
              credit: 3,
            ),
          ],
          '2022-2학기 수강과목': [
            CourseModel.empty().copyWith(
              name: '운영체제',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '컴퓨터통신',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '생명과학',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '자료구조',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '객체지향프로그래밍실습',
              credit: 3,
            ),
            CourseModel.empty().copyWith(
              name: '글쓰기',
              credit: 3,
            ),
          ],
        },
        // courses: argumentMap(),
      ),
    ));
  }
}
