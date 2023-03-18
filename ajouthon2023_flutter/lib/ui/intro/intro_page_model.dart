import '../../constant/getx/get_model.dart';

class IntroPageModel extends GetModel {
  const IntroPageModel({
    required this.id,
    required this.department,
    required this.grade,
    required this.departmentList,
    required this.isPluralMajor,
  });

  final int id;
  final int department;
  final int grade;
  final List<String> departmentList;
  final bool isPluralMajor;


  static const IntroPageModel _empty = IntroPageModel(
    id: 0,
    department: 0,
    grade: 0,
    departmentList: [],
    isPluralMajor: false,
  );

  factory IntroPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  IntroPageModel copyWith({
    int? id,
    int? department,
    int? grade,
    List<String>? departmentList,
    bool? isPluralMajor,
  }) {
    return IntroPageModel(
      department: department ?? this.department,
      grade: grade ?? this.grade,
      id: id ?? this.id,
      departmentList: departmentList ?? this.departmentList,
      isPluralMajor: isPluralMajor ?? this.isPluralMajor,
    );
  }

  @override
  List<Object?> get props => [grade, department, id, departmentList, isPluralMajor];


  @override
  String toString() => 'grade: $grade department: $department id: $id departmentList: $departmentList isPluralMajor: $isPluralMajor';
}
