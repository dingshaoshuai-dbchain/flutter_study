import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

import '../../util/toast_util.dart';
import '../../widgets/basis/container_widget.dart';
import '../../widgets/gaps.dart';
import '../../widgets_app/collected_widget.dart';
import '../../widgets_app/next_widget.dart';
import '../../widgets_app/plan_number_widget.dart';

class BasketballMatchIndexPage extends StatelessWidget {
  const BasketballMatchIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _BasketballMatchItem(
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

/// 赛事列表 - 篮球 item
class _BasketballMatchItem extends StatelessWidget {
  const _BasketballMatchItem({this.marginTop, this.marginBottom});

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
        Positioned(
          top: 0,
          bottom: 0,
          right: 132.w,
          child: TextWidget(
            text: '第四节 12:00',
            textColor: AppColors.main,
            fontSize: 11.sp,
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

  /// 身体区域（队伍名称、比分等..）
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        // 收藏按钮
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
                  TextWidget(
                    text: '巴塞罗那',
                    textColor: AppColors.color_181818,
                    fontSize: 13.sp,
                    width: 80.w,
                    alignment: Alignment.centerLeft,
                  ),
                  Gaps.vGap5,
                  TextWidget(
                    text: '巴塞罗那',
                    textColor: AppColors.color_181818,
                    fontSize: 13.sp,
                    width: 80.w,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              )
            ],
          ),
        ),
        // 队伍比分区域
        Positioned(
          bottom: 5.w,
          left: 45.w,
          right: 45.w,
          child: _buildScore(),
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

  /// 比分区域
  Widget _buildScore() {
    return ContainerWidget(
      height: 40.w,
      backgroundColor: Colors.red,
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         ListView.separated(
      //           scrollDirection: Axis.horizontal,
      //           shrinkWrap: true,
      //           itemCount: 5,
      //           itemBuilder: (context, index) {
      //             return _buildScoreItem();
      //           },
      //           separatorBuilder: (context, index) {
      //             return Gaps.hGap3;
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildScoreItem() {
    return TextWidget(
      text: '10',
      textColor: AppColors.color8B8B8B,
      fontSize: 11.sp,
      width: 20.w,
      height: 16.w,
      backgroundColor: AppColors.colorF7F8FC,
      radius: 2.5.w,
    );
  }
}
