import 'package:dss_base_flutter/init_sum.dart';
import 'package:fluro/fluro.dart';
import 'match_index_page.dart';

class MatchRouter implements RouterInitProvider {
  static const String _pageRoot = "/match/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void init(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MatchIndexPage()));
  }
}
