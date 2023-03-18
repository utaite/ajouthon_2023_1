import 'package:ajouthon2023/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../constant/api.dart';
import '../../constant/getx/get_controller.dart';
import '../../constant/styles.dart';
import '../../model/course/course_model.dart';
import 'course_add_page_model.dart';
import 'event/course_add_page_event.dart';

class CourseAddPageController extends GetController<CourseAddPageModel> {
  CourseAddPageController({
    required CourseAddPageModel model,
  }) : super(model);

  final Api api = Api();

  final rx.BehaviorSubject<CourseAddPageEvent> _eventSubject = rx.BehaviorSubject();

  @override
  void onInit() {
    super.onInit();
    _eventSubject.flatMap(_onExhaustEvent).listen((x) => x.call());
    onCourseAddPageLoadEvent();
  }

  Stream<VoidCallback> _onExhaustEvent(CourseAddPageEvent event) {
    final func = {
      CourseAddPageLoadEvent: _onExhaustLoadEvent,
      null: () {},
    };

    return func[event.runtimeType]?.call(event) ?? Stream.value(() {});
  }

  Stream<VoidCallback> _onExhaustLoadEvent(CourseAddPageLoadEvent event) {
    return Stream.fromFutures(event.departments.map((x) => api.getCourses(x)))
        .map((x) => () => _onListenLoad(x))
        .onErrorReturn(() => _onListenLoadError);
  }

  void _onListenLoad(Response<Iterable<CourseModel>> response) {
    final courses = response.body;

    if (courses is Iterable<CourseModel>) {
      final isBefore = (courses.firstOrNull?.department).elvis > (state.courses.firstOrNull?.department).elvis;

      change(
        state.copyWith(
          courses: [
            ...isBefore ? state.courses : [],
            ...courses.where((x) => !state.already.map((x) => x.name).contains(x.name)),
            ...isBefore ? [] : state.courses,
          ],
        ),
        status: RxStatus.success(),
      );
    }
  }

  void _onListenLoadError() {
    change(state, status: RxStatus.error());
  }

  void onCourseAddPageLoadEvent() {
    change(state, status: RxStatus.loading());
    _eventSubject.add(CourseAddPageLoadEvent(
      departments: state.departmentList.asMap().keys,
    ));
  }

  void onPressedCheckedCourse(String name) async {
    final item = state.courses.where((x) => x.name == name).firstOrNull;

    if (item is CourseModel) {
      await showModalBottomSheet(
        context: Get.context!,
        builder: (context) => SizedBox(
          height: 300,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      item.name,
                      style: textBlack18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      item.summary,
                      style: textBlack18,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void onPressedSelectDepartment(int department) {
    change(state.copyWith(
      selectDepartments: [
        ...state.selectDepartments.contains(department)
            ? state.selectDepartments.where((x) => x != department)
            : [
                ...state.selectDepartments,
                department,
              ],
      ],
    ));
  }

  void onPressedSelectGrade(int grade) {
    change(state.copyWith(
      selectGrades: [
        ...state.selectGrades.contains(grade)
            ? state.selectGrades.where((x) => x != grade)
            : [
                ...state.selectGrades,
                grade,
              ],
      ],
    ));
  }

  void onPressedSelectType(int type) {
    change(state.copyWith(
      selectTypes: [
        ...state.selectTypes.contains(type)
            ? state.selectTypes.where((x) => x != type)
            : [
                ...state.selectTypes,
                type,
              ],
      ],
    ));
  }
}
