import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';

import '../router_provider.dart';
import 'home_index_page.dart';

class HomeRouter implements IRouterProvider {
  static const String _pageRoot = "/home/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const HomeIndexPage()));
  }
}
