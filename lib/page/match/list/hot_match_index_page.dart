import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/collected_widget.dart';
import 'package:youliao/widgets/next_widget.dart';

import '../../../res/app_colors.dart';
import '../../../util/font_family_util.dart';
import '../../../widgets/plan_number_widget.dart';

class HotMatchIndexPage extends StatelessWidget {
  const HotMatchIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _HotMatchItem(
            marginTop: index == 0 ? 6.w : 0,
            marginBottom: index == 50 - 1 ? 6.w : 0,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.vGap6;
        },
        itemCount: 50,
      ),
    );
  }
}

/// 赛事列表 - 热门 item
class _HotMatchItem extends StatelessWidget {
  const _HotMatchItem({this.marginTop, this.marginBottom});

  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      marginTop: marginTop,
      marginBottom: marginBottom,
      width: 1.sw,
      height: 84.w,
      onPressed: () {
        Toast.show('跳转赛事详情');
      },
      child: Column(
        children: [
          // 标题
          SizedBox(
            height: 22.w,
            child: _buildTitle(context),
          ),
          Gaps.hLine(),
          // 内容
          Expanded(child: _buildBody(context))
        ],
      ),
    );
  }

  /// 标题区域（联赛名称、时间等..）
  Widget _buildTitle(BuildContext context) {
    return Stack(
      children: [
        // 联赛名称、时间
        Positioned(
          left: 12.w,
          top: 0,
          bottom: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '美职预备联',
                style: TextStyle(
                  color: const Color(0xFF8D6A2E),
                  fontSize: 10.sp,
                ),
              ),
              Gaps.hGap10,
              Text(
                '10:00',
                style: TextStyle(color: AppColors.summaryText2, fontSize: 10.sp),
              )
            ],
          ),
        ),
        // 比赛状态
        Positioned(
          right: 100.w,
          top: 0,
          bottom: 0,
          child: TextWidget(
            text: '完',
            textColor: AppColors.summaryText2,
            fontSize: 10.sp,
            width: 50.w,
          ),
        ),
        // 专家方案
        Align(
          alignment: Alignment.centerRight,
          child: PlanNumberWidget(
            marginRight: 8.w,
          ),
        )
      ],
    );
  }

  /// 身体区域（队伍 logo、名称、比分等..）
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        // 收藏按钮、队伍信息区域
        Positioned(
          top: 0,
          bottom: 0,
          left: 4.w,
          child: Row(
            children: [
              const CollectedWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTeamItem(context),
                  Gaps.vGap5,
                  _buildTeamItem(context),
                ],
              )
            ],
          ),
        ),
        // 比分区域
        Positioned(
          right: 100.w,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScoreItem(context, '100'),
              Gaps.vGap5,
              _buildScoreItem(context, '98'),
            ],
          ),
        ),
        // 图标区域
        Positioned(
          right: 15.w,
          top: 0,
          bottom: 0,
          child: const NextWidget(),
        )
      ],
    );
  }

  /// 队伍
  Widget _buildTeamItem(BuildContext context) {
    //TODO 长度过长会溢出
    return TextComposeWidget(
      text: '巴塞罗那',
      textColor: AppColors.mainText,
      fontSize: 13.sp,
      width: 180.w,
      textAlign: TextAlign.start,
      textExpanded: true,
      leftWidget: ImageWidget(
        url: 'ic_default_avatar',
        width: 18.w,
        height: 18.w,
        marginRight: 8.w,
      ),
    );
  }

  /// 比分 item
  Widget _buildScoreItem(BuildContext context, String text) {
    return TextWidget(
      text: text,
      textColor: AppColors.main,
      fontSize: 14.sp,
      width: 50.w,
      fontFamily: FontFamilyUtil.din,
    );
  }
}
