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
    final id = 202220635; // await PrefHelper.getPrefInt(PrefType.id);
    final department = 1; // await PrefHelper.getPrefInt(PrefType.department);
    final pluralMajor = 1; // await PrefHelper.getPrefInt(PrefType.pluralMajor);
    final pluralIndex = 0; // await PrefHelper.getPrefInt(PrefType.pluralIndex);

    change(state.copyWith(
      id: id,
      department: department,
      pluralMajor: pluralMajor,
      pluralIndex: pluralIndex,
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
}
