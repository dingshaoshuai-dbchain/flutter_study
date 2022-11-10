import 'package:fluro/fluro.dart';
import 'package:youliao/page/test/test_index_page.dart';
import 'package:youliao/page/test/test_sliver.dart';

import '../../router_provider.dart';

class TestRouter implements IRouterProvider {
  static const String _pageRoot = "/test/page";
  static const String indexPage = "$_pageRoot/index_page";
  static const String testSliverPager = "$_pageRoot/test_sliver";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const TestIndexPage()));
    router.define(testSliverPager,
        handler: Handler(handlerFunc: (_, __) => const TestSliverPage()));
  }
}
