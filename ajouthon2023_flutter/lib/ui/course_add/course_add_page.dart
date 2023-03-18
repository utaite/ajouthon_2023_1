import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'course_add_page_controller.dart';

class CourseAddPage extends GetView<CourseAddPageController> {
  const CourseAddPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: controller.rx((state) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Center(
              child: Text('Hello, CourseAdd!'),
            ),
          ),
        );
      }),
    );
  }
}
