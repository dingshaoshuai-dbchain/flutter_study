import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/models/hot_match_bean.dart';

import '../dss_library/net/base_entity.dart';

class MatchApi {
  MatchApi._();

  static final MatchApi _singleton = MatchApi._();

  factory MatchApi() => _singleton;

  static MatchApi get instance => _singleton;

  /// 转换一些 bean - st  ==========================================================

  List<HotMatchBean> convertByDynamic(dynamic data) {
    return List.from(data).map((e) => HotMatchBean.fromJson(e)).toList();
  }

  /// 转换一些 bean - ed  ==========================================================

  /// 获取首页精选赛事
  Future<BaseEntity> getHotMatch() {
    return HttpUtil.instance.get(
      url: 'sports-api/v4/forecast/quality/match',
    );
  }
}
