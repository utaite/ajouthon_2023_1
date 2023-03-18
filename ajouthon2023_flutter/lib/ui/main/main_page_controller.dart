import 'package:ajouthon2023/constant/extension.dart';

import '../../constant/getx/get_controller.dart';
import '../../model/route/route_model.dart';
import 'main_page_model.dart';

class MainPageController extends GetController<MainPageModel> {
  MainPageController({
    required MainPageModel model,
  }) : super(model);

  void onPressedList() async {
    await RouteModel.courseList().toNamed();
  }

  void onPressedAdd(int key) async {
    await RouteModel.courseAdd().toNamed();
  }
}
