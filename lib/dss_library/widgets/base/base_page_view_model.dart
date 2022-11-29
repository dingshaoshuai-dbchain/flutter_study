import 'package:flutter/cupertino.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

abstract class BasePageViewModel extends BaseViewModel{
  ValueNotifier<PageState> pageState = ValueNotifier(PageState.initState);

  void showLoadingPage() {
    pageState.value = PageState.loadingState;
  }

  void showContentPage() {
    pageState.value = PageState.contentState;
  }

  void showFailurePage() {
    pageState.value = PageState.failureState;
  }

  void showEmptyPage() {
    pageState.value = PageState.emptyState;
  }

  void initData();


}
