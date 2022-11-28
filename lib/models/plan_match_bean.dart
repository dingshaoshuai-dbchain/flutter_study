import 'package:json_annotation/json_annotation.dart';

part 'plan_match_bean.g.dart';

@JsonSerializable()
class PlanMatchBean {
  PlanMatchBean();

  // 赛事 id
  late num matchId;
  // 赛事类型
  late num sportType;
  // 联赛名称
  late String leagueName;
  // 主队名称
  late String? homeTeamName;
  // 主队 logo
  late String? homeTeamLogo;
  // 客队名称
  late String? awayTeamName;
  // 客队 logo
  late String? awayTeamLogo;
  // 比赛时间时间戳
  late num matchTime;
  // 比赛时间格式化后的字符串 11-25 03:30
  late String matchTimeStr;
  // 主队得分
  late num hostTeamScore;
  // 客队得分
  late num guestTeamScore;
  
  factory PlanMatchBean.fromJson(Map<String,dynamic> json) => _$Plan_match_beanFromJson(json);
  Map<String, dynamic> toJson() => _$Plan_match_beanToJson(this);
}
