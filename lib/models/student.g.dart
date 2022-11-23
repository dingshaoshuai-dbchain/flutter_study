// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student()
  ..userId = json['userId'] as num
  ..name = json['name'] as String?
  ..age = json['age'] as num
  ..sex = json['sex'] as num;

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
    };
