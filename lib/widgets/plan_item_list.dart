import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/plan_api.dart';
import 'package:youliao/dss_library/util/toast_util.dart';
import 'package:youliao/dss_library/widgets/base/base_page_view_model.dart';
import 'package:youliao/dss_library/widgets/gaps.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/widgets/plan_item.dart';

import '../dss_library/widgets/base/base_page_state.dart';

class PlanItemListWidget extends StatefulWidget {
  const PlanItemListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlanItemListWidgetState();
}

class _PlanItemListWidgetState
    extends BasePageState<PlanItemListWidget, _PlanItemListViewModel> {

  @override
  _PlanItemListViewModel onCreateViewModel() => _PlanItemListViewModel();

  @override
  Widget onCreateContentPage(BuildContext context) {
    List<PlanBean> data = viewModel.data ?? [];
    return ListView.separated(
      itemCount: data.length,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 9.w, right: 9.w),
      itemBuilder: (BuildContext context, int index) {
        return PlanItemWidget(
          marginTop: index == 0 ? 10.w : 0.0,
          marginBottom: index == 30 - 1 ? 10.w : 0.0,
          planBean: data[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gaps.vGap8;
      },
    );
  }

}

class _PlanItemListViewModel extends BasePageViewModel<List<PlanBean>> {
  _PlanItemListViewModel();

  List<PlanBean>? data;

  @override
  void onInitData() {
    // launchForPageState(
    //   future: PlanApi.instance.getPlanList2(),
    //   convert: (data) {
    //     return PlanApi.instance.convertByDynamic(data);
    //   },
    //   showEmpty: (data) => data.isEmpty,
    // );
  }

  @override
  void onInitDataSuccess(List<PlanBean> data) {
    this.data = data;
  }
}
