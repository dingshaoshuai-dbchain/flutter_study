// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School()
  ..name = json['name'] as String
  ..students = (json['students'] as List<dynamic>?)
      ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
      .toList()
  ..nickName = json['nick_name'] as String?;

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'name': instance.name,
      'students': instance.students,
      'nick_name': instance.nickName,
    };
