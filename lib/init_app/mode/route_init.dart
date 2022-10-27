import 'package:fluro/fluro.dart';
import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/util/navigator_util.dart';

import '../../page/expert/expert_router.dart';
import '../../page/home/home_router.dart';
import '../../page/match/match_router.dart';
import '../../page/my/match_router.dart';
import '../../page/predict/Predict_router.dart';
import '../../page/router_provider.dart';

class RouteInit extends InitAppModeProvider {
  @override
  init() {
    FluroRouter router = FluroRouter();
    List<IRouterProvider> routerList = [];
    routerList.add(HomeRouter());
    routerList.add(ExpertRouter());
    routerList.add(PredictRouter());
    routerList.add(MatchRouter());
    routerList.add(MyRouter());
    for (var element in routerList) {
      element.initRouter(router);
    }
    NavigatorUtil.init(
      router,
      'login/path',
      (pathWrapper, loginPath) {
        if(pathWrapper.path == '1'){
          pathWrapper.path = loginPath;
        }
      },
    );
  }
}
