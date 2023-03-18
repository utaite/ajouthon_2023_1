import '../../constant/getx/get_model.dart';

class CourseAddPageModel extends GetModel {
  const CourseAddPageModel();

  static const CourseAddPageModel _empty = CourseAddPageModel();

  factory CourseAddPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CourseAddPageModel copyWith() {
    return CourseAddPageModel();
  }

  @override
  List<Object?> get props => [];

  @override
  String toString() => '';
}
