// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person()
  ..nickname = json['nickname'] as String
  ..age = json['age'] as num
  ..father = Person.fromJson(json['father'] as Map<String, dynamic>)
  ..mother = Person.fromJson(json['mother'] as Map<String, dynamic>)
  ..wife = json['laopo'] == null
      ? null
      : Person.fromJson(json['laopo'] as Map<String, dynamic>)
  ..hobby = (json['hobby'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'age': instance.age,
      'father': instance.father,
      'mother': instance.mother,
      'laopo': instance.wife,
      'hobby': instance.hobby,
    };
