import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class CourseAddPageModel extends GetModel {
  const CourseAddPageModel({
    required this.departmentList,
    required this.already,
    required this.courses,
    required this.selectDepartments,
    required this.selectGrades,
    required this.selectTypes,
  });

  final List<String> departmentList;
  final Iterable<CourseModel> already;
  final Iterable<CourseModel> courses;
  final Iterable<int> selectDepartments;
  final Iterable<int> selectGrades;
  final Iterable<int> selectTypes;

  static const CourseAddPageModel _empty = CourseAddPageModel(
    departmentList: [],
    already: [],
    courses: [],
    selectDepartments: [],
    selectGrades: [],
    selectTypes: [],
  );

  factory CourseAddPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CourseAddPageModel copyWith({
    List<String>? departmentList,
    Iterable<CourseModel>? already,
    Iterable<CourseModel>? courses,
    Iterable<int>? selectDepartments,
    Iterable<int>? selectGrades,
    Iterable<int>? selectTypes,
  }) {
    return CourseAddPageModel(
      departmentList: departmentList ?? this.departmentList,
      already: already ?? this.already,
      courses: courses ?? this.courses,
      selectDepartments: selectDepartments ?? this.selectDepartments,
      selectGrades: selectGrades ?? this.selectGrades,
      selectTypes: selectTypes ?? this.selectTypes,
    );
  }

  @override
  List<Object?> get props => [departmentList, already, courses, selectDepartments, selectGrades, selectTypes];

  @override
  String toString() =>
      'departmentList: $departmentList already: $already courses: $courses selectDepartments: $selectDepartments selectGrades: $selectGrades selectTypes: $selectTypes';
}
