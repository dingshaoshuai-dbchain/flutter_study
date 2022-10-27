import 'package:fluro/fluro.dart';
import '../router_provider.dart';
import 'match_index_page.dart';

class MatchRouter implements IRouterProvider {
  static const String _pageRoot = "/match/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MatchIndexPage()));
  }
}
