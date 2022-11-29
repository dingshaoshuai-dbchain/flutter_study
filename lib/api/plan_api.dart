import 'package:youliao/global/match_mode.dart';

import '../dss_library/net/base_entity.dart';
import '../dss_library/net/http_util.dart';
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
    // 2赛事详情、直播间推荐方案 4全部最新方案 5免费 6临时 7竞彩串关
    int type = 4,
    // 方案类型
    MatchMode matchMode = MatchMode.all,
    int size = 20,
    // 用户id
    String? userId,
    // 排序 - 1盈利率 2时间 3准确率 4按人气 5连红
    int? sortValue,
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
    return HttpUtil.instance.get(
      url: 'sports-api/v41/expert/planAPP',
      queryParameters: params,
    );
  }
}
