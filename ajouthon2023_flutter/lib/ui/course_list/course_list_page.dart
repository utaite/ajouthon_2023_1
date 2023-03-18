import 'dart:math';

import 'package:ajouthon2023/constant/styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'course_list_page_controller.dart';

class CourseListPage extends GetView<CourseListPageController> {
  const CourseListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: controller.rx((state) {
          return SafeArea(
            child: Center(
              child: Text('Hello, CourseList!'),
            ),
          );
        }),
      ),
    );
  }
}
