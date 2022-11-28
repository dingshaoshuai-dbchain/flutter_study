// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_match_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotMatchBean _$Hot_match_beanFromJson(Map<String, dynamic> json) =>
    HotMatchBean()
      ..matchId = json['matchId'] as num
      ..count = json['count'] as num
      ..sportId = json['sportId'] as num
      ..tournamentName = json['tournamentName'] as String
      ..matchTime = json['matchTime'] as String
      ..matchTime2 = json['matchTime2'] as num
      ..homeTeamName = json['homeTeamName'] as String
      ..awayTeamName = json['awayTeamName'] as String
      ..homeTeamLogo = json['homeTeamLogo'] as String
      ..awayTeamLogo = json['awayTeamLogo'] as String;

Map<String, dynamic> _$Hot_match_beanToJson(HotMatchBean instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'count': instance.count,
      'sportId': instance.sportId,
      'tournamentName': instance.tournamentName,
      'matchTime': instance.matchTime,
      'matchTime2': instance.matchTime2,
      'homeTeamName': instance.homeTeamName,
      'awayTeamName': instance.awayTeamName,
      'homeTeamLogo': instance.homeTeamLogo,
      'awayTeamLogo': instance.awayTeamLogo,
    };
