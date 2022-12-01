import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:easy_refresh/easy_refresh.dart';

class RefreshInit extends ModeInitProvider {
  @override
  init() {
    EasyRefresh.defaultHeaderBuilder = () => const ClassicHeader(
          dragText: '下拉刷新',
          armedText: '释放开始',
          readyText: '刷新中...',
          processingText: '刷新中...',
          processedText: '成功了',
          noMoreText: '没有更多',
          failedText: '失败了',
          messageText: '最后更新于 %T',
        );
    EasyRefresh.defaultFooterBuilder = () => const ClassicFooter(
          dragText: '上拉加载',
          armedText: '释放开始',
          readyText: '加载中...',
          processingText: '加载中...',
          processedText: '成功了',
          noMoreText: '没有更多',
          failedText: '失败了',
          messageText: '最后更新于 %T',
        );
  }
}
