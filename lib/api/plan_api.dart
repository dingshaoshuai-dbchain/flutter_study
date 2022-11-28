import 'package:youliao/global/match_mode.dart';

import '../dss_library/net/http_util.dart';

class PlanApi {
  PlanApi._();

  static final PlanApi _singleton = PlanApi._();

  factory PlanApi() => _singleton;

  static PlanApi get instance => _singleton;

  /// 获取方案列表
  void getPlanList({
    // 2赛事详情、直播间推荐方案 4全部最新方案 5免费 6临时 7竞彩串关
    int type = 4,
    // 方案类型
    MatchMode matchMode = MatchMode.all,
    int size = 20,
    // 用户id
    String? userId,
    // 排序 - 1盈利率 2时间 3准确率 4按人气 5连红
    int? sortValue,
    required NetSuccessTCallback<List<Object>> onSuccess,
    required NetFailureCallback onFailure,
  }) {
    Map<String, dynamic> params = {};
    params.putIfAbsent('type', () => type);
    params.putIfAbsent('sportType', () => matchMode.sportId);
    params.putIfAbsent('size', () => size);
    if (userId != null) {
      params.putIfAbsent('userId', () => userId);
    }
    if (sortValue != null) {
      params.putIfAbsent('sortValue', () => sortValue);
    }
    HttpUtil.instance.getCallback(
      url: 'sports-api/v41/expert/planAPP',
      queryParameters: params,
      onSuccess: (dynamic data) {},
      onFailure: onFailure,
    );
  }
}
