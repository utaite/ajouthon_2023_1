import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class CourseAddPageModel extends GetModel {
  const CourseAddPageModel({
    required this.grade,
    required this.departmentList,
    required this.courses,
    required this.checkedCourses,
    required this.selectDepartments,
    required this.selectGrades,
    required this.selectTypes,
  });

  final int grade;
  final List<String> departmentList;
  final Iterable<CourseModel> courses;
  final Map<int, Iterable<String>> checkedCourses;
  final Iterable<int> selectDepartments;
  final Iterable<int> selectGrades;
  final Iterable<int> selectTypes;

  static const CourseAddPageModel _empty = CourseAddPageModel(
    grade: -1,
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
    List<String>? departmentList,
    Iterable<CourseModel>? courses,
    Map<int, Iterable<String>>? checkedCourses,
    Iterable<int>? selectDepartments,
    Iterable<int>? selectGrades,
    Iterable<int>? selectTypes,
  }) {
    return CourseAddPageModel(
      grade: grade ?? this.grade,
      departmentList: departmentList ?? this.departmentList,
      courses: courses ?? this.courses,
      checkedCourses: checkedCourses ?? this.checkedCourses,
      selectDepartments: selectDepartments ?? this.selectDepartments,
      selectGrades: selectGrades ?? this.selectGrades,
      selectTypes: selectTypes ?? this.selectTypes,
    );
  }

  @override
  List<Object?> get props => [grade, departmentList, courses, checkedCourses, selectDepartments, selectGrades, selectTypes];

  @override
  String toString() =>
      'grade: $grade departmentList: $departmentList courses: $courses checkedCourses: $checkedCourses selectDepartments: $selectDepartments selectGrades: $selectGrades selectTypes: $selectTypes';
}
