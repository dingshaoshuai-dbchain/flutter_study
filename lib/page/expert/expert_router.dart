import 'package:fluro/fluro.dart';

import '../router_provider.dart';
import 'expert_index_page.dart';

class ExpertRouter implements IRouterProvider {
  static const String _pageRoot = "/expert/page";
  static const String indexPage = "$_pageRoot/index_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const ExpertIndexPage()));
  }
}
