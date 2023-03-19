import 'package:ajouthon2023/constant/extension.dart';

import '../../constant/getx/get_model.dart';

class CourseModel extends GetModel {
  const CourseModel({
    required this.uuid,
    required this.department,
    required this.type,
    required this.name,
    required this.credit,
    required this.time,
    required this.grade,
    required this.summary,
    required this.prerequisite,
  });

  final String uuid;
  final int department;
  final int type;
  final String name;
  final int credit;
  final int time;
  final int grade;
  final String summary;
  final Iterable<String> prerequisite;

  static const CourseModel _empty = CourseModel(
    uuid: '',
    department: 0,
    type: 0,
    name: '',
    credit: 0,
    time: 0,
    grade: 0,
    summary: '',
    prerequisite: [],
  );

  factory CourseModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  String get typeString => ['교양필수', '전공필수', '전공선택'][type].elvis;

  String get gradeString => '${(grade + 1) ~/ 2}-${(grade + 1) % 2 + 1}학기';

  Iterable<String> get tags => [gradeString, typeString, '$credit학점', '선수과목 ${prerequisite.isset ? 'O' : 'X'}'];

  factory CourseModel.fromJson(dynamic json) => json is Map<String, dynamic>
      ? _empty.copyWith(
          uuid: json['uuid'],
          department: json['department'],
          type: json['type'],
          name: json['name'],
          credit: json['credit'],
          time: json['time'],
          grade: json['grade'],
          summary: json['summary'],
          prerequisite: [
            ...Iterable.castFrom(json['prerequisite'] ?? const []),
          ],
        )
      : _empty;

  @override
  CourseModel copyWith({
    String? uuid,
    int? department,
    int? type,
    String? name,
    int? credit,
    int? time,
    int? grade,
    String? summary,
    Iterable<String>? prerequisite,
  }) {
    return CourseModel(
      uuid: uuid ?? this.uuid,
      department: department ?? this.department,
      type: type ?? this.type,
      name: name ?? this.name,
      credit: credit ?? this.credit,
      time: time ?? this.time,
      grade: grade ?? this.grade,
      summary: summary ?? this.summary,
      prerequisite: prerequisite ?? this.prerequisite,
    );
  }

  @override
  List<Object?> get props => [uuid, department, name, credit, time, grade, summary, prerequisite];

  @override
  String toString() =>
      'uuid: $uuid department: $department type: $type name: $name credit: $credit time: $time grade: $grade summary: $summary prerequisite: $prerequisite';
}
