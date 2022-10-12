import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:youliao/routers/expert/page/expert_index_page.dart';
import 'package:youliao/routers/router_provider.dart';

class ExpertRouter implements IRouterProvider {
  static const String _pageRoot = "/expert/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const ExpertIndexPage()));
  }
}
