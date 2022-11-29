// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertBean _$Expert_beanFromJson(Map<String, dynamic> json) => ExpertBean()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..picUrl = json['picUrl'] as String
  ..des = json['des'] as String
  ..introduction = json['introduction'] as String
  ..numM = json['numM'] as num
  ..numN = json['numN'] as num
  ..rate = json['rate'] as num
  ..redNum = json['redNum'] as num
  ..in12Hour = json['in12Hour'] as num
  ..in24Hour = json['in24Hour'] as num
  ..lastDate = json['lastDate'] as String
  ..fans = json['fans'] as num
  ..focus = json['focue'] as int
  ..hasRecommended = json['hasRecommended'] as String?;

Map<String, dynamic> _$Expert_beanToJson(ExpertBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'des': instance.des,
      'introduction': instance.introduction,
      'numM': instance.numM,
      'numN': instance.numN,
      'rate': instance.rate,
      'redNum': instance.redNum,
      'in12Hour': instance.in12Hour,
      'in24Hour': instance.in24Hour,
      'lastDate': instance.lastDate,
      'fans': instance.fans,
      'focue': instance.focus,
      'hasRecommended': instance.hasRecommended,
    };
