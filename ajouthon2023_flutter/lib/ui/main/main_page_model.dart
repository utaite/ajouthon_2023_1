import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class MainPageModel extends GetModel {
  const MainPageModel({
    required this.courses,
  });

  final Map<int, List<CourseModel>> courses;

  static const MainPageModel _empty = MainPageModel(
    courses: {},
  );

  factory MainPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  MainPageModel copyWith({
    Map<int, List<CourseModel>>? courses,
  }) {
    return MainPageModel(
      courses: courses ?? this.courses,
    );
  }

  @override
  List<Object?> get props => [courses];

  @override
  String toString() => 'courses: $courses';
}
