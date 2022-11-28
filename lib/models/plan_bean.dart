import 'package:json_annotation/json_annotation.dart';
import 'package:youliao/global/plan_mode.dart';

import "plan_match_bean.dart";

part 'plan_bean.g.dart';

@JsonSerializable()
class PlanBean {
  PlanBean();

  // 专家 id
  late num expertId;

  // 专家昵称
  late String name;

  // 专家头像
  late String picUrl;

  late String title;

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
  late String label;
  late String lotteryClassName;

  // 1红 2黑 3走水 其他未出结果
  late num hitStatus;

  // 1不中就退
  late num guarantee;

  // 方案包含的赛事
  late List<PlanMatchBean> expertTeams;

  factory PlanBean.fromJson(Map<String, dynamic> json) =>
      _$Plan_beanFromJson(json);

  Map<String, dynamic> toJson() => _$Plan_beanToJson(this);

  /// 获取方案模式
  PlanMode getPlanMode() {
    if (label.contains('2串1')) {
      return PlanMode.and21;
    } else if (label.contains('打包组')) {
      return PlanMode.package;
    } else {
      return PlanMode.single;
    }
  }

  /// 是否免费方案
  bool isFreePlan() => isFree == 1;

  /// 是否不中就退
  bool isFailureReturn() => guarantee == 1;
}
