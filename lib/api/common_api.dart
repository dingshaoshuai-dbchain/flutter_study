import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/models/banner_bean.dart';

class CommonApi {
  CommonApi._();

  static final CommonApi _singleton = CommonApi._();

  factory CommonApi() => _singleton;

  static CommonApi get instance => _singleton;

  void getBanner({
    // 1资讯banner 2直播页banner 3预测方案banner 4个人中心banner 5首页大背景图 6预测首页banner 7资讯首页banner
    required int locationId,
    required NetSuccessCallbackT<List<BannerBean>> onSuccess,
    required NetFailureCallback onFailure,
  }) {
    HttpUtil.instance.getCallback(
      url: 'live-api/v1.0/banner/getBanners',
      queryParameters: {
        'terminal': '1',
        'locationId': locationId,
      },
      onSuccess: (dynamic data) {
        List<BannerBean> list =
            List.from(data).map((e) => BannerBean.fromJson(e)).toList();
        onSuccess(list);
      },
      onFailure: onFailure,
    );
  }
}
