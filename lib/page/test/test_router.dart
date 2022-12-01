import 'package:dss_base_flutter/init_sum.dart';
import 'package:fluro/fluro.dart';
import 'package:youliao/page/test/page/test_future_stream.dart';
import 'package:youliao/page/test/page/test_json_page.dart';
import 'package:youliao/page/test/page/test_list_refresh_2_page.dart';
import 'package:youliao/page/test/page/test_list_refresh_page.dart';
import 'package:youliao/page/test/page/test_nested_scroll_page.dart';
import 'package:youliao/page/test/page/test_sliver_pager.dart';
import 'package:youliao/page/test/test_index_page.dart';


class TestRouter implements RouterInitProvider {
  static const String _pageRoot = "/test/page";
  static const String indexPage = "$_pageRoot/index_page";
  static const String testSliverPage = "$_pageRoot/test_sliver";
  static const String testNestedScrollerPage =
      "$_pageRoot/test_nested_scroller";
  static const String testJsonPage = "$_pageRoot/test_json_page";
  static const String testFutureStream = "$_pageRoot/test_future_stream";
  static const String testListRefresh = "$_pageRoot/test_list_refresh_page";
  static const String testListRefresh2 = "$_pageRoot/test_list_refresh2_page";

  @override
  void init(FluroRouter router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, __) => const TestIndexPage()));
    router.define(testSliverPage,
        handler: Handler(handlerFunc: (_, __) => const TestSliverPage()));
    router.define(testNestedScrollerPage,
        handler: Handler(handlerFunc: (_, __) => const TestNestedScrollPage()));
    router.define(testJsonPage,
        handler: Handler(handlerFunc: (_, __) => const TestJsonPage()));
    router.define(testFutureStream,
        handler: Handler(handlerFunc: (_, __) => const TestFutureStream()));
    router.define(testListRefresh,
        handler: Handler(handlerFunc: (_, __) => const TestListRefreshPage()));
    router.define(testListRefresh2,
        handler: Handler(handlerFunc: (_, __) => const TestListRefresh2Page()));
  }
}
