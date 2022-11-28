// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_match_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan_match_bean _$Plan_match_beanFromJson(Map<String, dynamic> json) =>
    Plan_match_bean()
      ..matchId = json['matchId'] as num
      ..sportType = json['sportType'] as num
      ..leagueName = json['leagueName'] as String
      ..homeTeamName = json['homeTeamName'] as String
      ..homeTeamLogo = json['homeTeamLogo'] as String
      ..awayTeamName = json['awayTeamName'] as String
      ..awayTeamLogo = json['awayTeamLogo'] as String
      ..matchTime = json['matchTime'] as num
      ..matchTimeStr = json['matchTimeStr'] as String
      ..hostTeamScore = json['hostTeamScore'] as num
      ..guestTeamScore = json['guestTeamScore'] as num;

Map<String, dynamic> _$Plan_match_beanToJson(Plan_match_bean instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'sportType': instance.sportType,
      'leagueName': instance.leagueName,
      'homeTeamName': instance.homeTeamName,
      'homeTeamLogo': instance.homeTeamLogo,
      'awayTeamName': instance.awayTeamName,
      'awayTeamLogo': instance.awayTeamLogo,
      'matchTime': instance.matchTime,
      'matchTimeStr': instance.matchTimeStr,
      'hostTeamScore': instance.hostTeamScore,
      'guestTeamScore': instance.guestTeamScore,
    };
