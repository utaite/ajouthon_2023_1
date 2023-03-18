import 'package:get/get.dart';

import '../model/course/course_model.dart';

const String url = 'https://ajouthon2023.jollyrock-baa25231.koreacentral.azurecontainerapps.io';

const Iterable<int> creditList = [140, 120, 120];
const Iterable<String> collegeList = ['소프트웨어융합대학', '공과대학', '인문대학'];
const Iterable<String> departmentList = ['소프트웨어학과', '융합시스템공학과', '불어불문학과'];
const Iterable<String> majorList = ['복수전공', '부전공'];

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
