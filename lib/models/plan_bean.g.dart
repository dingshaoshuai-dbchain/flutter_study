// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan_bean _$Plan_beanFromJson(Map<String, dynamic> json) => Plan_bean()
  ..expertId = json['expertId'] as num
  ..name = json['name'] as String
  ..picUrl = json['picUrl'] as String
  ..publishTime = json['publishTime'] as num
  ..showRateNumM = json['showRateNumM'] as num
  ..showRate = json['showRate'] as num
  ..isFree = json['isFree'] as num
  ..price = json['price'] as num
  ..expertTeams = (json['expertTeams'] as List<dynamic>)
      .map((e) => Plan_match_bean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$Plan_beanToJson(Plan_bean instance) => <String, dynamic>{
      'expertId': instance.expertId,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'showRateNumM': instance.showRateNumM,
      'showRate': instance.showRate,
      'isFree': instance.isFree,
      'price': instance.price,
      'expertTeams': instance.expertTeams,
    };
