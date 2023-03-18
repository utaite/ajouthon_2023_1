import 'package:flutter/services.dart';

import '../constant/getx/get_controller.dart';
import 'app_model.dart';

class AppController extends GetController<AppModel> {
  AppController({
    required AppModel model,
  }) : super(model);

  @override
  void onInit() async {
    super.onInit();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
