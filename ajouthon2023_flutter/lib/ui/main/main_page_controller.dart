import 'dart:math';

import 'package:ajouthon2023/constant/extension.dart';

import '../../constant/getx/get_controller.dart';
import '../../constant/pref_helper.dart';
import '../../model/course/course_model.dart';
import '../../model/route/route_model.dart';
import 'main_page_model.dart';

class MainPageController extends GetController<MainPageModel> {
  MainPageController({
    required MainPageModel model,
  }) : super(model);

  @override
  void onInit() async {
    super.onInit();
    final courses = await Future.wait([
      ...PrefType.values.take(8).map((x) async => await PrefHelper.getPrefStringList(x)),
    ]);
    final credits = await Future.wait([
      ...PrefType.values.skip(8).take(8).map((x) async => await PrefHelper.getPrefStringList(x)),
    ]);
    final id = await PrefHelper.getPrefInt(PrefType.id);
    final department = await PrefHelper.getPrefInt(PrefType.department);
    final pluralMajor = await PrefHelper.getPrefInt(PrefType.pluralMajor);
    final pluralIndex = await PrefHelper.getPrefInt(PrefType.pluralIndex);
    final exchangeGrade = await PrefHelper.getPrefInt(PrefType.exchangeGrade);
    final fieldPracticeGrade = await PrefHelper.getPrefInt(PrefType.fieldPracticeGrade);
    final paranGrade = await PrefHelper.getPrefInt(PrefType.paranGrade);

    change(state.copyWith(
      id: id,
      department: department,
      pluralMajor: pluralMajor,
      pluralIndex: pluralIndex,
      exchangeGrade: max(0, exchangeGrade),
      fieldPracticeGrade: max(0, fieldPracticeGrade),
      paranGrade: max(0, paranGrade),
      courses: Map.fromEntries([
        ...courses.asMap().entries.map((x) => MapEntry(x.key, [
              ...x.value.asMap().entries.map((y) => CourseModel.empty().copyWith(
                    name: y.value,
                    credit: int.tryParse(credits[x.key][y.key]).elvis,
                  )),
            ])),
      ]),
    ));
  }

  void onDismissed(int key, String name) async {
    final item = state.courses[key].elvis.where((x) => x.name == name).firstOrNull;

    if (item is CourseModel) {
      change(state.copyWith(
        courses: Map.fromEntries([
          ...state.courses.entries.map((x) => MapEntry(
              x.key,
              x.key == key
                  ? [
                      ...x.value.where((y) => y.name != name),
                    ]
                  : x.value)),
        ]),
      ));

      await PrefHelper.setPrefStringList(PrefType.values[key], state.courses[key].elvis.map((x) => x.name));
      await PrefHelper.setPrefStringList(PrefType.values.skip(8).toList()[key], state.courses[key].elvis.map((x) => '${x.credit}'));
    }
  }

  void onDismissedEtc(int key) async {
    change(state.copyWith(
      exchangeGrade: key == 0 ? 0 : null,
      fieldPracticeGrade: key == 1 ? 0 : null,
      paranGrade: key == 2 ? 0 : null,
    ));

    final pref = [PrefType.exchangeGrade, PrefType.fieldPracticeGrade, PrefType.paranGrade][key];
    await PrefHelper.setPrefInt(pref, 0);
  }

  void onPressedList() async {
    await RouteModel.courseList().toNamed();
  }

  void onPressedAdd(int key) async {
    await RouteModel.courseAdd().toNamed(
      arguments: [
        key,
        [state.department, state.pluralIndex].where((x) => x >= 0).toList(),
        state.courses,
      ],
    );

    final courses = await Future.wait([
      ...PrefType.values.take(8).map((x) async => await PrefHelper.getPrefStringList(x)),
    ]);
    final credits = await Future.wait([
      ...PrefType.values.skip(8).take(8).map((x) async => await PrefHelper.getPrefStringList(x)),
    ]);

    change(state.copyWith(
      courses: Map.fromEntries([
        ...courses.asMap().entries.map((x) => MapEntry(x.key, [
              ...x.value.asMap().entries.map((y) => CourseModel.empty().copyWith(
                    name: y.value,
                    credit: int.tryParse(credits[x.key][y.key]).elvis,
                  )),
            ])),
      ]),
    ));
  }

  void onPressedReset() async {
    change(state.copyWith(
      courses: {},
    ));

    await Future.wait([
      ...List.generate(8, (i) => i).map((x) async {
        await PrefHelper.setPrefStringList(PrefType.values[x], []);
        await PrefHelper.setPrefStringList(PrefType.values.skip(8)[x]!, []);
      }),
      PrefHelper.setPrefInt(PrefType.exchangeGrade, 0),
      PrefHelper.setPrefInt(PrefType.fieldPracticeGrade, 0),
      PrefHelper.setPrefInt(PrefType.paranGrade, 0),
    ]);
  }
}
