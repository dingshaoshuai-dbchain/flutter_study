import 'package:dss_base_flutter/widgets/gaps.dart';
import 'package:flutter/cupertino.dart';

/// 一般用于需要请求数据，如果请求失败就隐藏不显示（可以重写为其他展示方式）的 widget
abstract class BaseDataWidgetState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  /// 初始化数据（请求网络数据等）
  void initData();

  /// 用来检查是否需要展示占位视图
  bool checkShowPlace(BuildContext context);

  /// 请求回来数据之前的视图
  Widget onBuildPlaceWidget(BuildContext context) => Gaps.empty;

  /// 请求回来数据之后的真正的视图
  Widget onBuildContentWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return checkShowPlace(context)
        ? onBuildPlaceWidget(context)
        : onBuildContentWidget(context);
  }
}
