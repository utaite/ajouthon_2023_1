import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: controller.rx((state) {
            return Center(
              child: FractionallySizedBox(
                widthFactor: 4 / 5,
                child: Image.asset('assets/logo.png'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
