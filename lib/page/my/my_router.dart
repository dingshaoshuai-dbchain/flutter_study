import 'package:fluro/fluro.dart';

import '../router_provider.dart';
import 'my_index_page.dart';

class MyRouter implements IRouterProvider {
  static const String _pageRoot = "/my/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MyIndexPage()));
  }
}
