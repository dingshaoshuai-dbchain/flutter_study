import 'package:fluro/fluro.dart';
import 'package:youliao/routers/expert/expert_router.dart';
import 'package:youliao/routers/match/match_router.dart';
import 'package:youliao/routers/my/match_router.dart';
import 'package:youliao/routers/predict/Predict_router.dart';

import 'home/home_router.dart';
import 'router_provider.dart';

class Routes {
  static const List<IRouterProvider> _routerList = [];
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
