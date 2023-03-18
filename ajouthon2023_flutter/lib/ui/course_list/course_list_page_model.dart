import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class CourseListPageModel extends GetModel {
  const CourseListPageModel({
    required this.departmentList,
    required this.courses,
    required this.selectDepartments,
    required this.selectGrades,
    required this.selectTypes,
  });

  final Iterable<String> departmentList;
  final Iterable<CourseModel> courses;
  final Iterable<int> selectDepartments;
  final Iterable<int> selectGrades;
  final Iterable<int> selectTypes;

  static const CourseListPageModel _empty = CourseListPageModel(
    departmentList: [],
    courses: [],
    selectDepartments: [],
    selectGrades: [],
    selectTypes: [],
  );

  factory CourseListPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CourseListPageModel copyWith({
    Iterable<String>? departmentList,
    Iterable<CourseModel>? courses,
    Iterable<int>? selectDepartments,
    Iterable<int>? selectGrades,
    Iterable<int>? selectTypes,
  }) {
    return CourseListPageModel(
      departmentList: departmentList ?? this.departmentList,
      courses: courses ?? this.courses,
      selectDepartments: selectDepartments ?? this.selectDepartments,
      selectGrades: selectGrades ?? this.selectGrades,
      selectTypes: selectTypes ?? this.selectTypes,
    );
  }

  @override
  List<Object?> get props => [departmentList, courses, selectDepartments, selectGrades, selectTypes];

  @override
  String toString() =>
      'departmentList: $departmentList courses: $courses selectDepartments: $selectDepartments selectGrades: $selectGrades selectTypes: $selectTypes';
}
