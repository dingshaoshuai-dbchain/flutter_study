import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/models/banner_bean.dart';

import '../dss_library/net/base_entity.dart';

class CommonApi {
  CommonApi._();

  static final CommonApi _singleton = CommonApi._();

  factory CommonApi() => _singleton;

  static CommonApi get instance => _singleton;

  /// 转换一些 bean - st  ==========================================================

  List<BannerBean> convertByDynamic(dynamic data) {
    return List.from(data).map((e) => BannerBean.fromJson(e)).toList();
  }

  /// 转换一些 bean - ed  ==========================================================

  /// 获取 banner
  Future<BaseEntity> getBanner({
    // 1资讯banner 2直播页banner 3预测方案banner 4个人中心banner 5首页大背景图 6预测首页banner 7资讯首页banner
    required int locationId,
  }) {
    return HttpUtil.instance.get(
      url: 'live-api/v1.0/banner/getBanners',
      queryParameters: {
        'terminal': '1',
        'locationId': locationId,
      },
    );
  }
}
