import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'app/app_controller.dart';
import 'app/app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<AppController>(AppController(
    model: AppModel.empty().copyWith(
      brightness: Brightness.light,
    ),
  ));
  runApp(const App());
}
