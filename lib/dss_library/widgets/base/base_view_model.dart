import 'package:flutter/cupertino.dart';
import 'package:youliao/dss_library/net/base_entity.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

import '../../net/http_util.dart';

typedef ValueFunction<T> = T Function(dynamic data);
typedef ValueFunction2<T,E> = T Function(E data);

abstract class BaseViewModel {
  ValueNotifier<LoadingDialogState> state =
      ValueNotifier(LoadingDialogState.init);

  /// 加载对话框 - 显示
  void showLoadingDialog() {
    state.value = LoadingDialogState.show;
  }

  /// 加载对话框 - 隐藏
  void hideLoadingDialog() {
    state.value = LoadingDialogState.hide;
  }

  /// 省事的加载逻辑
  void launch<T>({
    bool isShowLoadingDialog = true,
    required Future<BaseEntity> future,
    ValueFunction<T>? convert,
    required NetSuccessCallbackT<T> onSuccess,
    required NetFailureCallback onFailure,
    Function? onComplete,
  }) {
    if (isShowLoadingDialog) {
      showLoadingDialog();
    }
    HttpUtil.instance
        .simpleCallback(
      future: future,
      convert: convert,
      onSuccess: onSuccess,
      onFailure: onFailure,
    )
        .whenComplete(() {
      if (isShowLoadingDialog) {
        hideLoadingDialog();
      }
      onComplete?.call();
    });
  }
}
