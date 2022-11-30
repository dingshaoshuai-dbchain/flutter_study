import 'package:dss_base_flutter/init_sum.dart';
import 'package:fluro/fluro.dart';

import 'predict_index_page.dart';

class PredictRouter implements RouterInitProvider {
  static const String _pageRoot = "/predict/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void init(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const PredictIndexPage()));
  }
}
