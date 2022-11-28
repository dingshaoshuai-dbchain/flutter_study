import 'package:json_annotation/json_annotation.dart';

part 'hot_match_bean.g.dart';

@JsonSerializable()
class HotMatchBean {
  HotMatchBean();

  late num matchId;
  late num count;
  late num sportId;
  // 联赛名称
  late String tournamentName;
  late String matchTime;
  late num matchTime2;
  late String homeTeamName;
  late String awayTeamName;
  late String homeTeamLogo;
  late String awayTeamLogo;
  
  factory HotMatchBean.fromJson(Map<String,dynamic> json) => _$Hot_match_beanFromJson(json);
  Map<String, dynamic> toJson() => _$Hot_match_beanToJson(this);
}
