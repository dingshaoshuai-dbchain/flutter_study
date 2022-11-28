import 'package:json_annotation/json_annotation.dart';

part 'banner_bean.g.dart';

@JsonSerializable()
class BannerBean {
  BannerBean();

  late String id;
  // 类型（1图片 2视频 3直播）
  late num mediaType;
  String? title;
  String? imageUrl;
  String? videoUrl;
  // 跳转方式（0无跳转 1活动详情 2资讯页面 3直播间 4站内页面 5用户主页）
  num? redirectType;
  String? redirectId;
  String? redirectUrl;
  String? showDetailText;
  String? liveTitle;
  String? remark;
  late num order;
  
  factory BannerBean.fromJson(Map<String,dynamic> json) => _$Banner_beanFromJson(json);
  Map<String, dynamic> toJson() => _$Banner_beanToJson(this);
}
