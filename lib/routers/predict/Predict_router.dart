import 'package:fluro/fluro.dart';
import 'package:youliao/routers/router_provider.dart';

import 'page/predict_index_page.dart';

class PredictRouter implements IRouterProvider {
  static const String _pageRoot = "/predict/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const PredictIndexPage()));
  }
}
