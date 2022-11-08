import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/global/plan_mode.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets_app/hit_rate_widget.dart';

class PlanItemWidget extends StatelessWidget {
  const PlanItemWidget({super.key, this.marginTop, this.marginBottom});

  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      marginTop: marginTop,
      marginBottom: marginBottom,
      backgroundColor: Colors.white,
      radius: 8.w,
      child: Stack(
        children: [
          Column(
            children: [
              _buildAnchor(),
              _buildContent(),
              _buildMatch(),
              _buildBottom(),
            ],
          ),
          Positioned(
            right: 50.w,
            bottom: 28.w,
            child: TextWidget(
              width: 40.w,
              paddingBottom: 1,
              text: '不中就退',
              textColor: Colors.white,
              fontSize: 8.sp,
              radius: 5.w,
              radiusBottomRight: 0,
              backgroundColor: Color(0xFFFF0F47),
            ),
          ),
          Positioned(
            right: 32.w,
            bottom: 65.w,
            child: ImageWidget(
              url: 'app/ic_plan_result_red',
              width: 33.w,
              height: 33.w,
            ),
          )
        ],
      ),
    );
  }

  /// 作者区域
  Widget _buildAnchor() {
    return Row(
      children: [
        ImageWidget(
          url: 'app/ic_default_avatar',
          width: 19.w,
          height: 19.w,
          marginLeft: 14.w,
          marginTop: 12.w,
          marginBottom: 10.w,
          fit: BoxFit.cover,
        ),
        TextWidget(
          text: '蔡萌萌',
          textColor: AppColors.color_181818,
          fontSize: 10.sp,
          marginLeft: 6.w,
        ),
        ImageWidget(
          url: 'app/ic_v',
          width: 11.w,
          height: 10.w,
          marginLeft: 8,
          marginRight: 6.5.w,
        ),
        Text(
          '社区红人',
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.color_999999,
          ),
        ),
        const Spacer(),
        HitRateWidget(),
        Gaps.hGapValue(20.w)
      ],
    );
  }

  /// 内容区域
  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 2.w,
        bottom: 10.w,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '【2串1】',
              style: TextStyle(color: PlanMode.And_2_1.color),
            ),
            TextSpan(
              text:
                  '每场比赛都由作者第一时间带给您都解读分析，包括最终推荐价低覆盖场次多，欢迎大家尝鲜体验欢迎大家尝鲜体验欢迎大家尝鲜体验',
              style: TextStyle(color: AppColors.color_666666, fontSize: 12.sp),
            )
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 赛事信息区域
  Widget _buildMatch() {
    return ContainerWidget(
      width: double.infinity,
      height: 38.w,
      backgroundColor: AppColors.colorF5F5F5,
      radius: 9.w,
      marginHorizontal: 15.w,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ImageWidget(
              url: PlanMode.And_2_1.iconPath ?? '',
              width: 38.w,
              height: 15.w,
            ),
          ),
          Text.rich(
            TextSpan(
                text: '  竞足 ',
                style: TextStyle(
                  color: const Color(0xFF3564FB),
                  fontSize: 9.sp,
                ),
                children: [
                  TextSpan(
                    text: '英超 03:00',
                    style: TextStyle(
                      color: AppColors.color_999999,
                      fontSize: 9.sp,
                    ),
                  ),
                  TextSpan(
                    text: '     纽卡斯尔联 VS 阿森纳',
                    style: TextStyle(
                        color: AppColors.color_181818,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  /// 底部区域
  Widget _buildBottom() {
    return ContainerWidget(
      width: double.infinity,
      height: 32.w,
      marginHorizontal: 16.w,
      marginBottom: 5.w,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Text(
            '10分钟前发布',
            style: TextStyle(color: AppColors.color_999999, fontSize: 9.sp),
          ),
          Positioned(
            right: 0,
            child: ContainerWidget(
              width: 60.w,
              height: 21.w,
              borderSide: BorderSide(
                color: AppColors.main,
                width: 0.5.w,
              ),
              radius: 10.w,
              child: Row(
                children: [
                  ImageWidget(
                    url: 'app/ic_gold',
                    width: 11.w,
                    height: 11.w,
                    marginLeft: 4.w,
                  ),
                  Expanded(
                    child: TextWidget(
                      text: '128金币',
                      textColor: AppColors.main,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
