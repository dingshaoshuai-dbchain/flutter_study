import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/models/hot_match_bean.dart';

class MatchApi {
  MatchApi._();

  static final MatchApi _singleton = MatchApi._();

  factory MatchApi() => _singleton;

  static MatchApi get instance => _singleton;

  void getHotMatch({
    required NetSuccessTCallback<List<HotMatchBean>> onSuccess,
    required NetFailureCallback onFailure,
  }) {
    HttpUtil.instance.getCallback(
      url: 'sports-api/v4/forecast/quality/match',
      onSuccess: (dynamic data) {
        List<HotMatchBean> list =
            List.from(data).map((e) => HotMatchBean.fromJson(e)).toList();
        onSuccess(list);
      },
      onFailure: onFailure,
    );
  }
}
