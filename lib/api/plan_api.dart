import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/global/match_mode.dart';

import '../models/index.dart';

class PlanApi {
  PlanApi._();

  static final PlanApi _singleton = PlanApi._();

  factory PlanApi() => _singleton;

  static PlanApi get instance => _singleton;

  /// 转换一些 bean - st  ==========================================================

  List<PlanBean> convertByDynamic(dynamic data) {
    return List.from(data).map((e) => PlanBean.fromJson(e)).toList();
  }

  /// 转换一些 bean - ed  ==========================================================

  /// 获取方案列表
  Future<BaseEntity> getPlanList({
    // 数量
    int size = 20,
    // 2赛事详情、直播间推荐方案 4全部最新方案 5免费 6临时 7竞彩串关
    required int type,
    // 方案类型
    required MatchMode matchMode,
    // 用户id
    String? userId,
    // 排序 - 1盈利率 2时间 3准确率 4按人气 5连红
    int? sortValue,
  }) {
    Map<String, dynamic> params = {};
    params['type'] = type;
    params['sportType'] = matchMode.sportId;
    params['size'] = size;
    if (userId != null) {
      params['userId'] = userId;
    }
    if (sortValue != null) {
      params['sortValue'] = sortValue;
    }
    return HttpUtil.instance.get(
      url: 'sports-api/v41/expert/planAPP',
      queryParameters: params,
    );
  }
}
