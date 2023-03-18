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
      ...PrefType.values.skip(8).map((x) async => await PrefHelper.getPrefStringList(x)),
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

  void onPressedList() async {
    await RouteModel.courseList().toNamed();
  }

  void onPressedAdd(int key) async {
    await RouteModel.courseAdd().toNamed(
      arguments: [
        state.courses.values.expand((x) => x).toList(),
      ],
    );
  }
}
