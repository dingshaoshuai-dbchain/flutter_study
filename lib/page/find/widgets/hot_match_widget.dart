import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/match_api.dart';
import 'package:youliao/dss_library/net/http_util.dart';
import 'package:youliao/dss_library/widgets/base/base_data_widget_state.dart';
import 'package:youliao/models/hot_match_bean.dart';

import '../../../dss_library/res/colors.dart';
import '../../../dss_library/util/font_weiget_util.dart';
import '../../../dss_library/util/toast_util.dart';
import '../../../dss_library/widgets/basis/container_widget.dart';
import '../../../dss_library/widgets/basis/image_widget.dart';
import '../../../dss_library/widgets/basis/text_widget.dart';
import '../../../dss_library/widgets/gaps.dart';
import '../../../res/app_colors.dart';

class HotMatchWidget extends StatefulWidget {
  const HotMatchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HotMatchWidgetState();
}

class _HotMatchWidgetState extends BaseDataWidgetState<HotMatchWidget> {
  List<HotMatchBean> _data = [];

  @override
  bool checkShowPlace(context) => _data.isEmpty;

  @override
  void initData() {
    HttpUtil.instance.simpleCallback(
      future: MatchApi.instance.getHotMatch(),
      convert: (data) {
        return MatchApi.instance.convertByDynamic(data);
      },
      onSuccess: (data) {
        setState(() {
          _data = data;
        });
      },
      onFailure: (_, __) {
        setState(() {});
      },
    );
  }

  @override
  Widget onBuildContentWidget(context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      radius: 8.w,
      child: Column(
        children: [
          _buildTitle(context),
          Gaps.hLine(),
          _buildBody(context),
        ],
      ),
    );
  }

  /// 标题区域
  Widget _buildTitle(BuildContext context) {
    return SizedBox(
      height: 34.w,
      child: Row(
        children: [
          ImageWidget(
            url: 'ic_hot_match',
            width: 62.w,
            height: 13.w,
            marginLeft: 7.w,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4,
              right: 5.w,
            ),
            child: Gaps.vLine(thickness: 1.w, height: 13.w),
          ),
          ImageWidget(
            url: 'ic_hot_match_calendar',
            width: 10.w,
            height: 10.w,
            marginRight: 3.w,
          ),
          Text(
            '今日精选${_data.length}场赛事',
            style: TextStyle(
              color: AppColors.summaryText2,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }

  /// 内容区域
  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: 72.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          HotMatchBean bean = _data.elementAt(index);
          return _buildItem(context, bean);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gaps.vLine();
        },
      ),
    );
  }

  /// 精选赛事 item
  Widget _buildItem(BuildContext context, HotMatchBean bean) {
    return ContainerWidget(
      width: 154.w,
      onPressed: () {
        Toast.show('跳转赛事详情 - ${bean.tournamentName}');
      },
      child: Column(
        children: [
          _buildMatch(context, bean),
          const Spacer(),
          _buildTeam(context, bean.homeTeamName, bean.homeTeamLogo),
          const Spacer(),
          _buildTeam(context, bean.awayTeamName, bean.awayTeamLogo),
          const Spacer(),
        ],
      ),
    );
  }

  /// 赛事信息 - 名称、时间..
  Widget _buildMatch(BuildContext context, HotMatchBean bean) {
    return Row(
      children: [
        TextWidget(
          text: bean.tournamentName,
          textColor: AppColors.mainText,
          fontSize: 10.sp,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
          marginLeft: 9.w,
          marginTop: 7.w,
          marginRight: 3.w,
        ),
        Expanded(
          child: TextWidget(
            text: bean.matchTime,
            textColor: AppColors.summaryText2,
            marginTop: 7.w,
            fontSize: 10.sp,
            alignment: Alignment.centerLeft,
          ),
        ),
        bean.count > 0
            ? _buildPlanNumberWidget(context, bean.count)
            : Gaps.empty,
      ],
    );
  }

  /// 方案数量
  Widget _buildPlanNumberWidget(BuildContext context, num count) {
    return SizedBox(
      width: 48.w,
      height: 16.w,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            left: 6.w,
            right: 0,
            child: TextWidget(
              text: '$count方案',
              maxLines: 1,
              textColor: Colors.white,
              width: 40.w,
              height: 14.w,
              fontSize: 8.sp,
              backgroundColor: const Color(0xFFD73422),
              paddingLeft: 12.w,
            ),
          ),
          Positioned(
            child: ImageWidget(
              url: 'ic_hot_match_plan',
              width: 16.w,
              height: 16.w,
            ),
          )
        ],
      ),
    );
  }

  /// 队伍信息
  Widget _buildTeam(BuildContext context, String teamName, String teamLogo) {
    return Row(
      children: [
        ImageWidget(
          url: teamLogo,
          width: 18.w,
          height: 18.w,
          marginLeft: 9.w,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 2.w),
            child: Text(
              teamName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.mainText,
                fontSize: 12.sp,
                fontWeight: FontWeightUtil.pingFangSCSemibold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
