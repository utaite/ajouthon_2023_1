import 'package:ajouthon2023/constant/api.dart';
import 'package:ajouthon2023/constant/extension.dart';

import '../../constant/getx/get_controller.dart';
import '../../constant/pref_helper.dart';
import '../../model/route/route_model.dart';
import 'splash_page_model.dart';

class SplashPageController extends GetController<SplashPageModel> {
  SplashPageController({
    required SplashPageModel model,
  }) : super(model);

  final Api api = Api();

  @override
  void onInit() async {
    super.onInit();
    // PrefHelper.clear();

    final id = await PrefHelper.getPrefInt(PrefType.id);
    await Future.delayed(Duration(seconds: (id >= 0 ? 1 : 2)));
    await (id >= 0 ? RouteModel.main() : RouteModel.intro()).offAllNamed();
  }
}
