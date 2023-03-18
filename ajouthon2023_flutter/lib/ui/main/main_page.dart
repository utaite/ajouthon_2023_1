import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'main_page_controller.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: controller.rx((state) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Text(
                'Hello, Ajouton2023!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      }),
    );
  }
}
