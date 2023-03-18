import '../../constant/getx/get_model.dart';

class CourseListPageModel extends GetModel {
  const CourseListPageModel();

  static const CourseListPageModel _empty = CourseListPageModel();

  factory CourseListPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CourseListPageModel copyWith() {
    return CourseListPageModel();
  }

  @override
  List<Object?> get props => [];

  @override
  String toString() => '';
}
