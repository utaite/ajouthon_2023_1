import '../../constant/getx/get_model.dart';

class IntroPageModel extends GetModel {
  const IntroPageModel({
    required this.grade,
    required this.department,
    required this.id,
    required this.departmentList,
    required this.isPluralMajor,
    required this.isExchange,
    required this.isFieldPractice,
    required this.isParan,
    required this.pluralMajor,
    required this.subDepartment,
    required this.exchangeGrade,
    required this.fieldPracticeGrade,
    required this.paranGrade,
  });

  final int grade;
  final int department;
  final int id;
  final List<String> departmentList;
  final bool isPluralMajor;
  final bool isExchange;
  final bool isFieldPractice;
  final bool isParan;
  final int pluralMajor;
  final int subDepartment;
  final int exchangeGrade;
  final int fieldPracticeGrade;
  final int paranGrade;

  static const IntroPageModel _empty = IntroPageModel(
    grade: 0,
    department: -1,
    id: 0,
    departmentList: [],
    isPluralMajor: false,
    isExchange: false,
    isFieldPractice: false,
    isParan: false,
    pluralMajor: -1,
    subDepartment: -1,
    exchangeGrade: 0,
    fieldPracticeGrade: 0,
    paranGrade: 0,
  );

  factory IntroPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  IntroPageModel copyWith({
    int? grade,
    int? department,
    int? id,
    List<String>? departmentList,
    bool? isPluralMajor,
    bool? isExchange,
    bool? isFieldPractice,
    bool? isParan,
    int? pluralMajor,
    int? subDepartment,
    int? exchangeGrade,
    int? fieldPracticeGrade,
    int? paranGrade,
  }) {
    return IntroPageModel(
      grade: grade ?? this.grade,
      department: department ?? this.department,
      id: id ?? this.id,
      departmentList: departmentList ?? this.departmentList,
      isPluralMajor: isPluralMajor ?? this.isPluralMajor,
      isExchange: isExchange ?? this.isExchange,
      isFieldPractice: isFieldPractice ?? this.isFieldPractice,
      isParan: isParan ?? this.isParan,
      pluralMajor: pluralMajor ?? this.pluralMajor,
      subDepartment: subDepartment ?? this.subDepartment,
      exchangeGrade: exchangeGrade ?? this.exchangeGrade,
      fieldPracticeGrade: fieldPracticeGrade ?? this.fieldPracticeGrade,
      paranGrade: paranGrade ?? this.paranGrade,
    );
  }

  @override
  List<Object?> get props => [
        grade,
        department,
        id,
        departmentList,
        isPluralMajor,
        isExchange,
        isFieldPractice,
        isParan,
        pluralMajor,
        subDepartment,
        exchangeGrade,
        fieldPracticeGrade,
        paranGrade,
      ];

  @override
  String toString() =>
      '  grade: $grade department: $department id: $id departmentList: $departmentList isPluralMajor: $isPluralMajor isExchange: $isExchange isFieldPractice: $isFieldPractice isParan: $isParan pluralMajor: $pluralMajor subDepartment: $subDepartment exchangeGrade: $exchangeGrade fieldPracticeGrade: $fieldPracticeGrade paranGrade: $paranGrade  grade: $grade department: $department id: $id departmentList: $departmentList isPluralMajor: $isPluralMajor isExchange: $isExchange isFieldPractice: $isFieldPractice isParan: $isParan dualDepartment: $pluralMajor subDepartment: $subDepartment exchangeGrade: $exchangeGrade fieldPracticeGrade: $fieldPracticeGrade paranGrade: $paranGrade';
}
