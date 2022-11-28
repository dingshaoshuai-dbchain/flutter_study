// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanBean _$Plan_beanFromJson(Map<String, dynamic> json) => PlanBean()
  ..expertId = json['expertId'] as num
  ..name = json['name'] as String
  ..picUrl = json['picUrl'] as String
  ..title = json['title'] as String
  ..publishTime = json['publishTime'] as num
  ..showRateNumM = json['showRateNumM'] as num
  ..showRate = json['showRate'] as num
  ..isFree = json['isFree'] as num
  ..price = json['price'] as num
  ..label = json['label'] as String
  ..lotteryClassName = json['lotteryClassName'] as String
  ..hitStatus = json['hitStatus'] as num
  ..guarantee = json['guarantee'] as num
  ..expertTeams = (json['expertTeams'] as List<dynamic>)
      .map((e) => PlanMatchBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$Plan_beanToJson(PlanBean instance) => <String, dynamic>{
      'expertId': instance.expertId,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'showRateNumM': instance.showRateNumM,
      'showRate': instance.showRate,
      'isFree': instance.isFree,
      'price': instance.price,
      'label': instance.label,
      'lotteryClassName': instance.lotteryClassName,
      'hitStatus': instance.hitStatus,
      'guarantee': instance.guarantee,
      'expertTeams': instance.expertTeams,
    };
