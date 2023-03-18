import '../../constant/getx/get_controller.dart';
import 'intro_page_model.dart';

class IntroPageController extends GetController<IntroPageModel> {
  IntroPageController({
    required IntroPageModel model,
  }) : super(model);

  void onChangedId(String value) {
    change(state.copyWith(
      id: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedDepartment(int? index) {
    change(state.copyWith(
      department: index,
    ));
    print(state);
  }

  void onChangedGrade(String value) {
    change(state.copyWith(
      grade: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedPluralMajor(bool? value) {
    change(state.copyWith(
      isPluralMajor: value,
    ));
    print(state);
  }
}
