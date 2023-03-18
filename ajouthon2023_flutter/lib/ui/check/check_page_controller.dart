import 'package:ajouthon2023/constant/api.dart';
import 'package:ajouthon2023/constant/extension.dart';
import 'package:ajouthon2023/constant/pref_helper.dart';
import 'package:ajouthon2023/model/route/route_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../constant/getx/get_controller.dart';
import '../../model/course/course_model.dart';
import 'check_page_model.dart';
import 'event/check_page_event.dart';

class CheckPageController extends GetController<CheckPageModel> {
  CheckPageController({
    required CheckPageModel model,
  }) : super(model);

  final Api api = Api();

  final rx.BehaviorSubject<CheckPageEvent> _eventSubject = rx.BehaviorSubject();

  @override
  void onInit() {
    super.onInit();
    _eventSubject.flatMap(_onExhaustEvent).listen((x) => x.call());
    onCheckPageLoadEvent();
  }

  Stream<VoidCallback> _onExhaustEvent(CheckPageEvent event) {
    final func = {
      CheckPageLoadEvent: _onExhaustLoadEvent,
      null: () {},
    };

    return func[event.runtimeType]?.call(event) ?? Stream.value(() {});
  }

  Stream<VoidCallback> _onExhaustLoadEvent(CheckPageLoadEvent event) {
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
            ...courses,
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

  void onCheckPageLoadEvent() {
    change(state, status: RxStatus.loading());
    _eventSubject.add(CheckPageLoadEvent(
      departments: state.departments,
    ));
  }

  void onChangedCurrentGrade(int currentGrade) {
    change(state.copyWith(
      currentGrade: currentGrade + 1,
    ));
  }

  void onPressedGrade() async {
    await showModalBottomSheet<int>(
      context: Get.context!,
      builder: (context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(initialItem: state.currentGrade - 1),
          onSelectedItemChanged: onChangedCurrentGrade,
          itemExtent: 30,
          backgroundColor: CupertinoColors.white,
          children: [
            ...List.generate(state.grade, (i) => Text('${(i + 2) ~/ 2}-${(i + 2) % 2 + 1}학기')),
          ],
        ),
      ),
    );
  }

  void onPressedCheckedCourse(String name) {
    change(state.copyWith(
      checkedCourses: Map.fromEntries({
        ...state.checkedCourses.entries.map((x) => x.key == state.currentGrade - 1
            ? MapEntry(x.key, [
                ...x.value.contains(name)
                    ? x.value.where((x) => x != name)
                    : [
                        ...x.value,
                        name,
                      ],
              ])
            : MapEntry(x.key, x.value)),
      }),
    ));
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

  void onPressedNext() async {
    await Future.wait([
      ...state.checkedCourses.entries.map((x) async {
        await PrefHelper.setPrefStringList(PrefType.values[x.key], x.value);
        await PrefHelper.setPrefStringList(
            PrefType.values.skip(8)[x.key]!, state.courses.where((y) => x.value.contains(y.name)).map((z) => '${z.credit}'));
      }),
    ]);

    await RouteModel.main().offAllNamed();
  }
}
