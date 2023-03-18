import '../../constant/getx/get_model.dart';
import '../../model/course/course_model.dart';

class MainPageModel extends GetModel {
  const MainPageModel({
    required this.id,
    required this.department,
    required this.pluralMajor,
    required this.pluralIndex,
    required this.exchangeGrade,
    required this.fieldPracticeGrade,
    required this.paranGrade,
    required this.collegeList,
    required this.departmentList,
    required this.majorList,
    required this.courses,
  });

  final int id;
  final int department;
  final int pluralMajor;
  final int pluralIndex;
  final int exchangeGrade;
  final int fieldPracticeGrade;
  final int paranGrade;
  final Iterable<String> collegeList;
  final Iterable<String> departmentList;
  final Iterable<String> majorList;
  final Map<int, List<CourseModel>> courses;

  static const MainPageModel _empty = MainPageModel(
    id: 0,
    department: -1,
    pluralMajor: -1,
    pluralIndex: -1,
    exchangeGrade: 0,
    fieldPracticeGrade: 0,
    paranGrade: 0,
    collegeList: [],
    departmentList: [],
    majorList: [],
    courses: {},
  );

  factory MainPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  Iterable<MapEntry<int, int>> get etc => [exchangeGrade, fieldPracticeGrade, paranGrade].asMap().entries.where((x) => x.value > 0);

  bool get isEtc => exchangeGrade > 0 || fieldPracticeGrade > 0 || paranGrade > 0;

  @override
  MainPageModel copyWith({
    int? id,
    int? department,
    int? pluralMajor,
    int? pluralIndex,
    int? exchangeGrade,
    int? fieldPracticeGrade,
    int? paranGrade,
    Iterable<String>? collegeList,
    Iterable<String>? departmentList,
    Iterable<String>? majorList,
    Map<int, List<CourseModel>>? courses,
  }) {
    return MainPageModel(
      id: id ?? this.id,
      department: department ?? this.department,
      pluralMajor: pluralMajor ?? this.pluralMajor,
      pluralIndex: pluralIndex ?? this.pluralIndex,
      exchangeGrade: exchangeGrade ?? this.exchangeGrade,
      fieldPracticeGrade: fieldPracticeGrade ?? this.fieldPracticeGrade,
      paranGrade: paranGrade ?? this.paranGrade,
      collegeList: collegeList ?? this.collegeList,
      departmentList: departmentList ?? this.departmentList,
      majorList: majorList ?? this.majorList,
      courses: courses ?? this.courses,
    );
  }

  @override
  List<Object?> get props =>
      [id, department, pluralMajor, pluralIndex, exchangeGrade, fieldPracticeGrade, paranGrade, collegeList, departmentList, majorList, courses];

  @override
  String toString() =>
      'id: $id department: $department pluralMajor: $pluralMajor pluralIndex: $pluralIndex exchangeGrade: $exchangeGrade fieldPracticeGrade: $fieldPracticeGrade paranGrade: $paranGrade collegeList: $collegeList departmentList: $departmentList majorList: $majorList courses: $courses';
}
