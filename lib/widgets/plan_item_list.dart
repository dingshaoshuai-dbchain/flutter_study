import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/plan_api.dart';
import 'package:youliao/dss_library/util/toast_util.dart';
import 'package:youliao/dss_library/widgets/base/base_page.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/gaps.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/widgets/plan_item.dart';

class PlanItemListWidget extends StatefulWidget {
  const PlanItemListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlanItemListWidgetState();
}

class _PlanItemListWidgetState extends State<PlanItemListWidget>
    with BasePageState<PlanItemListWidget, _PlanItemListViewModel> {
  List<PlanBean> _data = [];

  @override
  _PlanItemListViewModel onCreateViewModel() => _PlanItemListViewModel();

  @override
  void initState() {
    super.initState();
    PlanApi.instance.getPlanList(
      onSuccess: (data) {
        setState(() {
          _data = data;
        });
      },
      onFailure: (code, msg) {
        Toast.show('请求失败');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _data.length,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 9.w, right: 9.w),
      itemBuilder: (BuildContext context, int index) {
        return PlanItemWidget(
          marginTop: index == 0 ? 10.w : 0.0,
          marginBottom: index == 30 - 1 ? 10.w : 0.0,
          planBean: _data[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gaps.vGap8;
      },
    );
  }
}

class _PlanItemListViewModel extends BaseViewModel {
  _PlanItemListViewModel();
}
