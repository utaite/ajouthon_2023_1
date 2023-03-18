import 'package:ajouthon2023/constant/extension.dart';

import '../../constant/getx/get_controller.dart';
import '../../model/route/route_model.dart';
import 'intro_page_model.dart';

class IntroPageController extends GetController<IntroPageModel> {
  IntroPageController({
    required IntroPageModel model,
  }) : super(model);

  void onChangedId(String value) {
    change(state.copyWith(
      id: int.tryParse(value),
    ));
  }

  void onChangedDepartment(int? index) {
    change(state.copyWith(
      department: index,
    ));
  }

  void onChangedGrade(String value) {
    change(state.copyWith(
      grade: int.tryParse(value),
    ));
  }

  void onChangedPluralMajor(bool? value) {
    change(state.copyWith(
      isPluralMajor: value,
    ));
  }

  void onPressedNext() async {
    await RouteModel.check().toNamed();
  }
}
