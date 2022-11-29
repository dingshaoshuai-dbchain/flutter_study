import 'package:json_annotation/json_annotation.dart';

part 'expert_bean.g.dart';

@JsonSerializable()
class ExpertBean {
  ExpertBean();

  late num id;
  late String name;
  late String picUrl;
  late String des;
  late String introduction;
  // 近numM中numN
  late num numM;
  // 近numM中numN
  late num numN;
  // 命中率
  late num rate;
  // x连红
  late num redNum;
  // 12小时内发的文章数量
  late num in12Hour;
  late num in24Hour;
  late String lastDate;
  // 粉丝数量
  late num fans;
  // 是否已关注 1关注
  @JsonKey(name:'focue') late int focus;
  String? hasRecommended;
  
  factory ExpertBean.fromJson(Map<String,dynamic> json) => _$Expert_beanFromJson(json);
  Map<String, dynamic> toJson() => _$Expert_beanToJson(this);
}
