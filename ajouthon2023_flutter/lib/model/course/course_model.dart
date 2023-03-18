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
  final String prerequisite;

  static const CourseModel _empty = CourseModel(
    uuid: '',
    department: 0,
    type: 0,
    name: '',
    credit: 0,
    time: 0,
    grade: 0,
    summary: '',
    prerequisite: '',
  );

  factory CourseModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

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
          prerequisite: json['prerequisite'],
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
    String? prerequisite,
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
  String toString() => 'uuid: $uuid department: $department type: $type name: $name credit: $credit time: $time grade: $grade summary: $summary prerequisite: $prerequisite';
}
