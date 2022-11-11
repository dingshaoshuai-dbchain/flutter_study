import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_compose_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/gaps.dart';

import '../../res_app/app_colors.dart';

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
            marginBottom: index == 100 - 1 ? 6.w : 0,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.vGapValue(6);
        },
        itemCount: 100,
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
          right: 100.w,
          top: 0,
          bottom: 0,
          child: TextWidget(
            text: '完',
            textColor: AppColors.color8B8B8B,
            fontSize: 10.sp,
            width: 50.w,
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
        // 收藏按钮、队伍信息区域
        Positioned(
          top: 0,
          bottom: 0,
          left: 4.w,
          child: Row(
            children: [
              ImageWidget(
                url: 'match/ic_collected_checked',
                width: 33.w,
                height: 33.w,
                padding: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComposeWidget(
                    text: '巴塞罗那',
                    textColor: AppColors.color_181818,
                    fontSize: 13.sp,
                    leftWidget: ImageWidget(
                      url: 'app/ic_default_avatar',
                      width: 18.w,
                      height: 18.w,
                      marginRight: 8.w,
                    ),
                  ),
                  Gaps.vGapValue(5.w),
                  TextComposeWidget(
                    text: '巴塞罗那',
                    textColor: AppColors.color_181818,
                    fontSize: 13.sp,
                    leftWidget: ImageWidget(
                      url: 'app/ic_default_avatar',
                      width: 18.w,
                      height: 18.w,
                      marginRight: 8.w,
                    ),
                  ),
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
              TextWidget(
                text: '100',
                textColor: AppColors.main,
                fontSize: 14.sp,
                width: 50.w,
                fontWeight: FontWeight.w600,
              ),
              Gaps.vGapValue(5.w),
              TextWidget(
                text: '100',
                textColor: AppColors.main,
                fontSize: 14.sp,
                width: 50.w,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        // 图标区域
        Positioned(
          right: 15.w,
          top: 0,
          bottom: 0,
          child: ImageWidget(
            url: 'common/ic_next_page',
            width: 6.w,
            height: 10.w,
          ),
        )
      ],
    );
  }
}
