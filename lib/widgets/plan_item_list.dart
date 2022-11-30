import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/plan_api.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/global/match_mode.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/widgets/plan_item.dart';


class PlanItemListWidget extends StatefulWidget {
  const PlanItemListWidget({
    super.key,
    this.type = 4,
    this.matchMode = MatchMode.all,
    this.sortValue = 2,
    this.userId,
  });

  final int type;
  final MatchMode matchMode;
  final int sortValue;
  final String? userId;

  @override
  State<StatefulWidget> createState() => _PlanItemListWidgetState();
}

class _PlanItemListWidgetState
    extends BasePageState<PlanItemListWidget, _PlanItemListViewModel> {

  @override
  _PlanItemListViewModel onCreateViewModel() => _PlanItemListViewModel();

  @override
  _RequestPlanBean onInitParams() => _RequestPlanBean(
        type: widget.type,
        matchMode: widget.matchMode,
        sortValue: widget.sortValue,
        userId: widget.userId ?? '',
      );

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
          marginBottom: index == data.length - 1 ? 10.w : 0.0,
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
    _RequestPlanBean bean = params;
    launchForPageState(
      future: PlanApi.instance.getPlanList(
        type: bean.type,
        matchMode: bean.matchMode,
        userId: bean.userId,
        sortValue: bean.sortValue,
      ),
      convert: (data) {
        return PlanApi.instance.convertByDynamic(data);
      },
      showEmpty: (data) => data.isEmpty,
    );
  }

  @override
  void onInitDataSuccess(List<PlanBean> data) {
    this.data = data;
  }
}

class _RequestPlanBean {
  const _RequestPlanBean({
    required this.type,
    required this.matchMode,
    required this.userId,
    required this.sortValue,
  });

  final int type;
  final MatchMode matchMode;
  final String userId;
  final int sortValue;
}
