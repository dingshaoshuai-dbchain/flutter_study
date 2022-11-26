import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person();

  // 昵称
  late String nickname;
  // 年龄
  late num age;
  // 父亲
  late Person father;
  // 母亲
  late Person mother;
  // 老婆，可能是个光棍，所以生命为可空类型
  @JsonKey(name:'laopo') Person? wife;
  // 爱好，有可能没有爱好，所以声明为可空类型
  List<String>? hobby;
  
  factory Person.fromJson(Map<String,dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
