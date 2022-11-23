import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  Student();

  // 学生的唯一标识
  late num userId;
  // 学生的姓名
  String? name;
  // 学生的年龄
  late num age;
  // 学生的性别（1男 0女）
  late num sex;
  
  factory Student.fromJson(Map<String,dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
