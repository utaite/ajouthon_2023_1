import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class CourseAddPageModel extends GetModel {
  const CourseAddPageModel({
    required this.grade,
    required this.departments,
    required this.departmentList,
    required this.courses,
    required this.checkedCourses,
    required this.selectDepartments,
    required this.selectGrades,
    required this.selectTypes,
  });

  final int grade;
  final Iterable<int> departments;
  final Iterable<String> departmentList;
  final Iterable<CourseModel> courses;
  final Map<int, Iterable<String>> checkedCourses;
  final Iterable<int> selectDepartments;
  final Iterable<int> selectGrades;
  final Iterable<int> selectTypes;

  static const CourseAddPageModel _empty = CourseAddPageModel(
    grade: -1,
    departments: [],
    departmentList: [],
    courses: [],
    checkedCourses: {},
    selectDepartments: [],
    selectGrades: [],
    selectTypes: [],
  );

  factory CourseAddPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CourseAddPageModel copyWith({
    int? grade,
    Iterable<int>? departments,
    Iterable<String>? departmentList,
    Iterable<CourseModel>? courses,
    Map<int, Iterable<String>>? checkedCourses,
    Iterable<int>? selectDepartments,
    Iterable<int>? selectGrades,
    Iterable<int>? selectTypes,
  }) {
    return CourseAddPageModel(
      grade: grade ?? this.grade,
      departments: departments ?? this.departments,
      departmentList: departmentList ?? this.departmentList,
      courses: courses ?? this.courses,
      checkedCourses: checkedCourses ?? this.checkedCourses,
      selectDepartments: selectDepartments ?? this.selectDepartments,
      selectGrades: selectGrades ?? this.selectGrades,
      selectTypes: selectTypes ?? this.selectTypes,
    );
  }

  @override
  List<Object?> get props => [grade, departments, departmentList, courses, checkedCourses, selectDepartments, selectGrades, selectTypes];

  @override
  String toString() =>
      'grade: $grade departments: $departments departmentList: $departmentList courses: $courses checkedCourses: $checkedCourses selectDepartments: $selectDepartments selectGrades: $selectGrades selectTypes: $selectTypes';
}
