import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets_app/football_match_card.dart';

import '../../util/toast_util.dart';
import '../../widgets/basis/container_widget.dart';
import '../../widgets/gaps.dart';
import '../../widgets_app/collected_widget.dart';
import '../../widgets_app/next_widget.dart';

class FootballMatchIndexPage extends StatelessWidget {
  const FootballMatchIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _FootballMatchItem(
            marginTop: index == 0 ? 6.w : 0,
            marginBottom: index == 100 - 1 ? 6.w : 0,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.vGapValue(6);
        },
        itemCount: 50,
      ),
    );
  }
}

class _FootballMatchItem extends StatelessWidget {
  const _FootballMatchItem({this.marginTop, this.marginBottom});

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
          SizedBox(
            height: 22.w,
            child: _buildTitle(context),
          ),
          Gaps.hLine(),
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
                style: TextStyle(color: AppColors.color8B8B8B, fontSize: 10.sp),
              )
            ],
          ),
        ),
        // 比赛状态
        Align(
          alignment: Alignment.center,
          child: TextWidget(
            text: '中',
            textColor: AppColors.main,
            fontSize: 10.sp,
          ),
        ),
        // 专家方案
        Align(
          alignment: Alignment.centerRight,
          child: ContainerWidget(
            marginRight: 8.w,
            backgroundColor: AppColors.main,
            width: 38.w,
            height: 12.w,
            radius: 2.w,
            child: Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: '专家',
                    textColor: Colors.white,
                    fontSize: 7.sp,
                  ),
                ),
                Expanded(
                  child: TextWidget(
                    text: '10',
                    textColor: AppColors.main,
                    fontSize: 7.sp,
                    backgroundColor: Colors.white,
                    marginVertical: 1.w,
                    marginRight: 1.w,
                    radiusTopRight: 2.w,
                    radiusBottomRight: 2.w,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /// 身体区域（队伍 logo、名称、比分等..）
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        // 收藏按钮
        Positioned(
          top: 0,
          bottom: 0,
          left: 4.w,
          child: const CollectedWidget(),
        ),
        // 队伍信息区域
        Positioned(
          bottom: 5.w,
          left: 45.w,
          right: 45.w,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildTeam(context, TextDirection.rtl)),
                  Gaps.hGap12,
                  _buildScoreItem(context, '2 - 1'),
                  Gaps.hGap12,
                  Expanded(child: _buildTeam(context, TextDirection.ltr)),
                ],
              ),
              Gaps.vGap5,
              Text(
                '半（0-0） 角（0-0）',
                style: TextStyle(color: AppColors.color8B8B8B, fontSize: 11.sp),
              )
            ],
          ),
        ),
        // 图标区域
        Positioned(
          right: 15.w,
          top: 0,
          bottom: 0,
          child: const NextWidget(),
        ),
      ],
    );
  }

  /// 队伍区域
  Widget _buildTeam(BuildContext context, TextDirection textDirection) {
    return Row(
      textDirection: textDirection,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 90.w
          ),
          child: Text(
            '皇家君主皇家君主皇家君主皇家君主',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.color_181818,
              fontSize: 14.sp,
            ),
          ),
        ),
        Gaps.hGapValue(4.w),
        const YellowCard(number: 2),
        Gaps.hGapValue(2.w),
        const RedCard(number: 2),
      ],
    );
  }

  /// 比分 item
  /// 如果某一队有两位数的话，中间的横杠就不在整个界面的最中间，不考虑这种情况
  Widget _buildScoreItem(BuildContext context, String text) {
    return TextWidget(
      text: text,
      textColor: AppColors.main,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }
}