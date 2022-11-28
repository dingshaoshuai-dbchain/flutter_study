import 'package:json_annotation/json_annotation.dart';
import "plan_match_bean.dart";
part 'plan_bean.g.dart';

@JsonSerializable()
class Plan_bean {
  Plan_bean();

  // 专家 id
  late num expertId;
  // 专家昵称
  late String name;
  // 专家头像
  late String picUrl;
  // 发布时间
  late num publishTime;
  // 近x场胜率
  late num showRateNumM;
  // 近$showRateNumM场胜率$showRate%
  late num showRate;
  // 是否免费 1免费
  late num isFree;
  // 方案价格
  late num price;
  // 方案包含的赛事
  late List<Plan_match_bean> expertTeams;
  
  factory Plan_bean.fromJson(Map<String,dynamic> json) => _$Plan_beanFromJson(json);
  Map<String, dynamic> toJson() => _$Plan_beanToJson(this);
}
