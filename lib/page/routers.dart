import 'package:fluro/fluro.dart';

import 'expert/expert_router.dart';
import 'home/home_router.dart';
import 'match/match_router.dart';
import 'my/match_router.dart';
import 'predict/Predict_router.dart';
import 'router_provider.dart';

class Routes {
  Routes._();

  static final Routes _singleton = Routes._();

  factory Routes() => _singleton;

  static Routes get instance => _singleton;

  late final FluroRouter _router;

  void init() {
    _router = FluroRouter();
    List<IRouterProvider> routerList = [
      HomeRouter(),
      ExpertRouter(),
      PredictRouter(),
      MatchRouter(),
      MyRouter(),
    ];

    for (var element in routerList) {
      element.initRouter(_router);
    }
  }
}
