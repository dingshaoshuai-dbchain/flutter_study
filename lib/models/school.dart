import 'package:json_annotation/json_annotation.dart';
import "student.dart";
part 'school.g.dart';

@JsonSerializable()
class School {
  School();

  // 学校的名称
  late String name;
  // 该学校的学生
  List<Student>? students;
  @JsonKey(ignore:true) String? test;
  @JsonKey(name:'nick_name') String? nickName;
  
  factory School.fromJson(Map<String,dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
