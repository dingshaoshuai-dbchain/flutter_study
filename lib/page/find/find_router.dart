import 'package:fluro/fluro.dart';

import '../router_provider.dart';
import 'find_index_page.dart';

class FindRouter implements IRouterProvider {
  static const String _pageRoot = "/find/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const FindIndexPage()));
  }
}
