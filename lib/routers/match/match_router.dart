import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:youliao/routers/match/page/match_index_page.dart';
import 'package:youliao/routers/router_provider.dart';

class MatchRouter implements IRouterProvider {
  static const String _pageRoot = "/match/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MatchIndexPage()));
  }
}
