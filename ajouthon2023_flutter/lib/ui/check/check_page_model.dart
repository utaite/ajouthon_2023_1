import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class CheckPageModel extends GetModel {
  const CheckPageModel({
    required this.grade,
    required this.currentGrade,
    required this.department,
    required this.departmentList,
    required this.pluralMajor,
    required this.subDepartment,
    required this.courses,
    required this.checkedCourses,
    required this.selectDepartments,
    required this.selectGrades,
    required this.selectTypes,
  });

  final int grade;
  final int currentGrade;
  final int department;
  final List<String> departmentList;
  final int pluralMajor;
  final int subDepartment;
  final Iterable<CourseModel> courses;
  final Map<int, Iterable<String>> checkedCourses;
  final Iterable<int> selectDepartments;
  final Iterable<int> selectGrades;
  final Iterable<int> selectTypes;

  static const CheckPageModel _empty = CheckPageModel(
    grade: 0,
    currentGrade: 0,
    department: -1,
    departmentList: [],
    pluralMajor: -1,
    subDepartment: -1,
    courses: [],
    checkedCourses: {},
    selectDepartments: [],
    selectGrades: [],
    selectTypes: [],
  );

  factory CheckPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  Iterable<int> get departments => [department, pluralMajor, subDepartment].where((x) => x >= 0);

  @override
  CheckPageModel copyWith({
    int? grade,
    int? currentGrade,
    int? department,
    List<String>? departmentList,
    int? pluralMajor,
    int? subDepartment,
    Iterable<CourseModel>? courses,
    Map<int, Iterable<String>>? checkedCourses,
    Iterable<int>? selectDepartments,
    Iterable<int>? selectGrades,
    Iterable<int>? selectTypes,
  }) {
    return CheckPageModel(
      grade: grade ?? this.grade,
      currentGrade: currentGrade ?? this.currentGrade,
      department: department ?? this.department,
      departmentList: departmentList ?? this.departmentList,
      pluralMajor: pluralMajor ?? this.pluralMajor,
      subDepartment: subDepartment ?? this.subDepartment,
      courses: courses ?? this.courses,
      checkedCourses: checkedCourses ?? this.checkedCourses,
      selectDepartments: selectDepartments ?? this.selectDepartments,
      selectGrades: selectGrades ?? this.selectGrades,
      selectTypes: selectTypes ?? this.selectTypes,
    );
  }

  @override
  List<Object?> get props => [
        grade,
        currentGrade,
        department,
        departmentList,
        pluralMajor,
        subDepartment,
        courses,
        checkedCourses,
        selectDepartments,
        selectGrades,
        selectTypes,
      ];

  @override
  String toString() =>
      'grade: $grade currentGrade: $currentGrade department: $department departmentList: $departmentList pluralMajor: $pluralMajor subDepartment: $subDepartment courses: $courses checkedCourses: $checkedCourses selectDepartments: $selectDepartments selectGrades: $selectGrades selectTypes: $selectTypes';
}
