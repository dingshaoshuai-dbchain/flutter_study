import 'package:dss_base_flutter/init_sum.dart';
import 'package:fluro/fluro.dart';

import 'expert_index_page.dart';

class ExpertRouter implements RouterInitProvider {
  static const String _pageRoot = "/expert/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void init(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const ExpertIndexPage()));
  }
}
