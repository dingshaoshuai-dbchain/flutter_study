import 'package:fluro/fluro.dart';

import 'expert/expert_router.dart';
import 'home/home_router.dart';
import 'match/match_router.dart';
import 'my/match_router.dart';
import 'predict/Predict_router.dart';
import 'router_provider.dart';

class Routes {
  static final List<IRouterProvider> _routerList = [];
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    _routerList.clear();
    _routerList.add(HomeRouter());
    _routerList.add(ExpertRouter());
    _routerList.add(PredictRouter());
    _routerList.add(MatchRouter());
    _routerList.add(MyRouter());
    for (var element in _routerList) {
      element.initRouter(router);
    }
  }
}
