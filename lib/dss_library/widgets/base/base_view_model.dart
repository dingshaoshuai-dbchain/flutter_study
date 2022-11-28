import 'package:flutter/cupertino.dart';
import 'package:youliao/dss_library/widgets/base/page_state.dart';

abstract class BaseViewModel {
  ValueNotifier<LoadingDialogState> state =
      ValueNotifier(LoadingDialogState.init);

  void showLoadingDialog() {
    state.value = LoadingDialogState.show;
  }

  void hideLoadingDialog() {
    state.value = LoadingDialogState.hide;
  }
}
