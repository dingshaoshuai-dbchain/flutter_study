import 'package:fluro/fluro.dart';

import 'expert/expert_router.dart';
import 'home/home_router.dart';
import 'match/match_router.dart';
import 'my/match_router.dart';
import 'predict/Predict_router.dart';
import 'router_provider.dart';

class Routes {
  static final FluroRouter _router = FluroRouter();

  static void initRoutes() {
    List<IRouterProvider> routerList = [];
    routerList.add(HomeRouter());
    routerList.add(ExpertRouter());
    routerList.add(PredictRouter());
    routerList.add(MatchRouter());
    routerList.add(MyRouter());

    for (var element in routerList) {
      element.initRouter(_router);
    }
  }
}
