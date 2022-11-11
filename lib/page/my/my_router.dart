import 'package:fluro/fluro.dart';
import 'package:youliao/page/my/login/login_page.dart';
import 'package:youliao/page/my/task/task_center_page.dart';

import '../router_provider.dart';
import 'my_index_page.dart';

class MyRouter implements IRouterProvider {
  static const String _pageRoot = "/my/page";
  static const String indexPage = "$_pageRoot/index_page";
  static const String loginPage = "$_pageRoot/login_page";
  static const String taskCenterPage = "$_pageRoot/task_center_page";

  @override
  void initRouter(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const MyIndexPage()));
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(taskCenterPage,
        handler: Handler(handlerFunc: (_, __) => const TaskCenterPage()));
  }
}
