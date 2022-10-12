import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:youliao/routers/my/page/my_index_page.dart';
import 'package:youliao/routers/router_provider.dart';

class MyRouter implements IRouterProvider {
  static const String _pageRoot = "/my/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MyIndexPage()));
  }
}
