import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/global/match_mode.dart';
import 'package:youliao/models/expert_bean.dart';

import '../dss_library/net/base_entity.dart';

class ExpertApi {
  ExpertApi._();

  static final ExpertApi _singleton = ExpertApi._();

  factory ExpertApi() => _singleton;

  static ExpertApi get instance => _singleton;

  /// 转换一些 bean - st  ==========================================================

  List<ExpertBean> convertByDynamic(dynamic data) {
    return List.from(data).map((e) => ExpertBean.fromJson(e)).toList();
  }

  /// 转换一些 bean - ed  ==========================================================

  /// 获取专家列表
  Future<BaseEntity> getExpertList({
    required MatchMode matchMode,
  }) {
    Map<String, dynamic> params = {
      'type': matchMode.sportId,
    };
    return HttpUtil.instance.get(
      url: 'sports-api/v4/expert/top',
      queryParameters: params,
    );
  }
}
