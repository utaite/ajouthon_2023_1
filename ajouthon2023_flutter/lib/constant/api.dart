import 'package:get/get.dart';

import '../model/course/course_model.dart';

const String url = 'https://ajouthon2023.jollyrock-baa25231.koreacentral.azurecontainerapps.io';
const List<String> departmentList = ['소프트웨어학과', '융합시스템공학과', '불어불문학과'];

class Api extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.errorSafety = false;
    httpClient.timeout = const Duration(seconds: 30);
  }

  /// GET
  Future<Response<Iterable<CourseModel>>> getCourses(int department) => get(
        [url, 'courses', department].join('/'),
        decoder: (json) {
          Get.log('[$runtimeType] getCourses: $json');
          return List.castFrom(json).whereType<Map<String, dynamic>>().map((x) => CourseModel.fromJson(x));
        },
      );
}
