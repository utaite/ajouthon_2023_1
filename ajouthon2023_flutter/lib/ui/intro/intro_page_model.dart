import '../../constant/getx/get_model.dart';

class IntroPageModel extends GetModel {
  const IntroPageModel({
    required this.grade,
    required this.department,
    required this.id,
    required this.departmentList,
    required this.majorList,
    required this.isPluralMajor,
    required this.isExchange,
    required this.isFieldPractice,
    required this.isParan,
    required this.pluralMajor,
    required this.pluralIndex,
    required this.exchangeGrade,
    required this.fieldPracticeGrade,
    required this.paranGrade,
    required this.index,
  });

  final int grade;
  final int department;
  final int id;
  final List<String> departmentList;
  final List<String> majorList;
  final bool isPluralMajor;
  final bool isExchange;
  final bool isFieldPractice;
  final bool isParan;
  final int pluralMajor;
  final int pluralIndex;
  final int exchangeGrade;
  final int fieldPracticeGrade;
  final int paranGrade;
  final int index;

  static const IntroPageModel _empty = IntroPageModel(
    grade: -1,
    department: -1,
    id: 0,
    departmentList: [],
    majorList: [],
    isPluralMajor: false,
    isExchange: false,
    isFieldPractice: false,
    isParan: false,
    pluralMajor: -1,
    pluralIndex: -1,
    exchangeGrade: 0,
    fieldPracticeGrade: 0,
    paranGrade: 0,
    index: 0,
  );

  factory IntroPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  bool get isFirst => department >= 0 && grade > 0 && id > 0;

  @override
  IntroPageModel copyWith({
    int? grade,
    int? department,
    int? id,
    List<String>? departmentList,
    List<String>? majorList,
    bool? isPluralMajor,
    bool? isExchange,
    bool? isFieldPractice,
    bool? isParan,
    int? pluralMajor,
    int? pluralIndex,
    int? exchangeGrade,
    int? fieldPracticeGrade,
    int? paranGrade,
    int? index,
  }) {
    return IntroPageModel(
      grade: grade ?? this.grade,
      department: department ?? this.department,
      id: id ?? this.id,
      departmentList: departmentList ?? this.departmentList,
      majorList: majorList ?? this.majorList,
      isPluralMajor: isPluralMajor ?? this.isPluralMajor,
      isExchange: isExchange ?? this.isExchange,
      isFieldPractice: isFieldPractice ?? this.isFieldPractice,
      isParan: isParan ?? this.isParan,
      pluralMajor: pluralMajor ?? this.pluralMajor,
      pluralIndex: pluralIndex ?? this.pluralIndex,
      exchangeGrade: exchangeGrade ?? this.exchangeGrade,
      fieldPracticeGrade: fieldPracticeGrade ?? this.fieldPracticeGrade,
      paranGrade: paranGrade ?? this.paranGrade,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [
        grade,
        department,
        id,
        departmentList,
        majorList,
        isPluralMajor,
        isExchange,
        isFieldPractice,
        isParan,
        pluralMajor,
        pluralIndex,
        exchangeGrade,
        fieldPracticeGrade,
        paranGrade,
        index,
      ];

  @override
  String toString() =>
      '  grade: $grade department: $department id: $id departmentList: $departmentList majorList: $majorList isPluralMajor: $isPluralMajor isExchange: $isExchange isFieldPractice: $isFieldPractice isParan: $isParan pluralMajor: $pluralMajor pluralIndex: $pluralIndex exchangeGrade: $exchangeGrade fieldPracticeGrade: $fieldPracticeGrade paranGrade: $paranGrade  grade: $grade department: $department id: $id departmentList: $departmentList isPluralMajor: $isPluralMajor isExchange: $isExchange isFieldPractice: $isFieldPractice isParan: $isParan dualDepartment: $pluralMajor pluralIndex: $pluralIndex exchangeGrade: $exchangeGrade fieldPracticeGrade: $fieldPracticeGrade paranGrade: $paranGrade index: $index';
}
