import 'package:get/get.dart';

import '../model/course/course_model.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.errorSafety = false;
    httpClient.timeout = const Duration(seconds: 30);
  }

  /// GET
  Future<Response<CourseModel>> getCourses() => get(
        [''].join('/'),
        decoder: (json) {
          Get.log('[$runtimeType] getHealth: $json');
          return CourseModel.fromJson(json);
        },
      );
}
