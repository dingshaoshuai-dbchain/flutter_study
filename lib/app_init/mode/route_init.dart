import 'package:fluro/fluro.dart';
import 'package:youliao/page/expert/expert_router.dart';
import 'package:youliao/page/find/find_router.dart';
import 'package:youliao/page/match/match_router.dart';
import 'package:youliao/page/my/my_router.dart';
import 'package:youliao/page/predict/predict_router.dart';
import 'package:youliao/page/test/test_router.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';


class RouteInit extends ModeInitProvider {
  @override
  init() {
    FluroRouter router = FluroRouter();
    List<RouterInitProvider> routerList = [];
    routerList.add(FindRouter());
    routerList.add(ExpertRouter());
    routerList.add(PredictRouter());
    routerList.add(MatchRouter());
    routerList.add(MyRouter());
    routerList.add(TestRouter());
    for (var element in routerList) {
      element.init(router);
    }
    NavigatorUtil.init(
        router: router,
        loginPagePath: 'login/path',
        checkLoginFunction: () {
          /// TODO 改为真正的判断是否需要登录
          return false;
        });
  }
}
