import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/widgets/hit_rate_widget.dart';
import 'package:youliao/widgets/plan_result_mark_widget.dart';


class PlanItemWidget extends StatelessWidget {
  const PlanItemWidget({
    super.key,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    required this.planBean,
  });

  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  final PlanBean planBean;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
      backgroundColor: Colors.white,
      radius: 8.w,
      onPressed: () {
        Toast.show('跳转方案详情');
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAnchor(context, planBean),
              _buildContent(context, planBean),
              _buildMatch(context, planBean),
              _buildBottom(context, planBean),
            ],
          ),
        ],
      ),
    );
  }

  /// 作者区域
  Widget _buildAnchor(BuildContext context, PlanBean bean) {
    return ContainerWidget(
      onPressed: () {
        Toast.show('跳转专家主页');
      },
      child: Row(
        children: [
          ImageWidget(
            url: bean.picUrl,
            width: 20.w,
            height: 20.w,
            imageRadius: 10.w,
            marginLeft: 14.w,
            marginTop: 12.w,
            marginBottom: 10.w,
            fit: BoxFit.cover,
          ),
          TextWidget(
            text: bean.name,
            textColor: AppColors.mainText,
            fontSize: 10.sp,
            marginLeft: 6.w,
          ),
          ImageWidget(
            url: 'ic_v',
            width: 11.w,
            height: 10.w,
            marginLeft: 8,
            marginRight: 6.5.w,
          ),
          Text(
            '社区红人',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.summaryText2,
            ),
          ),
          const Spacer(),
          HitRateWidget(number: bean.showRateNumM, rate: bean.showRate),
          Gaps.hGap20
        ],
      ),
    );
  }

  /// 内容区域
  Widget _buildContent(BuildContext context, PlanBean bean) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 2.w,
        bottom: 10.w,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: bean.label,
              style: TextStyle(color: bean.getPlanMode().color),
            ),
            TextSpan(
              text: bean.title,
              style: TextStyle(color: AppColors.summaryText, fontSize: 12.sp),
            )
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 赛事信息区域
  Widget _buildMatch(BuildContext context, PlanBean bean) {
    String? iconPath = bean.getPlanMode().iconPath;
    PlanMatchBean matchBean = bean.expertTeams[0];
    return ContainerWidget(
      width: double.infinity,
      height: 38.w,
      backgroundColor: AppColors.mainBackground,
      radius: 9.w,
      marginHorizontal: 15.w,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          iconPath == null
              ? Gaps.empty
              : Positioned(
                  top: 0,
                  left: 0,
                  child: ImageWidget(
                    url: iconPath,
                    width: 38.w,
                    height: 15.w,
                  ),
                ),
          Text.rich(
            TextSpan(
              text: '  ${bean.lotteryClassName} ',
              style: TextStyle(
                color: const Color(0xFF3564FB),
                fontSize: 9.sp,
              ),
              children: [
                TextSpan(
                  text: '${matchBean.leagueName} ${matchBean.matchTimeStr}',
                  style: TextStyle(
                    color: AppColors.summaryText2,
                    fontSize: 9.sp,
                  ),
                ),
                TextSpan(
                  text:
                      '     ${matchBean.homeTeamName} VS ${matchBean.awayTeamName}',
                  style: TextStyle(
                    color: AppColors.mainText,
                    fontSize: 11.sp,
                    fontWeight: FontWeightUtil.pingFangSCSemibold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: PlanResultMarkWidget(hitStatus: bean.hitStatus),
          ),
        ],
      ),
    );
  }

  /// 底部区域
  Widget _buildBottom(BuildContext context, PlanBean bean) {
    String? tips;
    if (bean.isFailureReturn()) {
      tips = '不中就退';
    } else if (bean.expertTeams.length > 1) {
      tips = '精选${bean.expertTeams.length}场';
    } else if (bean.hitStatus == 0) {
      tips = '推荐';
    }

    /// 金币左上方的提示红标
    Widget buildTipsWidget() {
      return tips == null
          ? Gaps.empty
          : Transform.translate(
              offset: const Offset(-20, -10),
              child: TextWidget(
                minHeight: 0,
                paddingHorizontal: 5.w,
                paddingBottom: 1,
                text: tips,
                textColor: Colors.white,
                fontSize: 8.sp,
                radius: 5.w,
                radiusBottomRight: 0,
                backgroundColor: const Color(0xFFFF0F47),
              ),
            );
    }

    return ContainerWidget(
      width: double.infinity,
      height: 32.w,
      marginHorizontal: 16.w,
      marginBottom: 5.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '发布时间待调试',
            style: TextStyle(color: AppColors.summaryText2, fontSize: 9.sp),
          ),
          Stack(
            children: [
              ContainerWidget(
                height: 21.w,
                borderSide: BorderSide(
                  color: AppColors.main,
                  width: 0.5.w,
                ),
                radius: 10.w,
                child: Row(
                  children: [
                    ImageWidget(
                      url: 'ic_gold',
                      width: 11.w,
                      height: 11.w,
                      marginLeft: 4.w,
                    ),
                    TextWidget(
                      text: bean.isFreePlan() ? '免费' : '${bean.price}金币',
                      minWidth: 40.w,
                      maxWidth: 100.w,
                      paddingLeft: 2.w,
                      paddingRight: 4.w,
                      textColor: AppColors.main,
                      fontSize: 10.sp,
                      fontWeight: FontWeightUtil.pingFangSCSemibold,
                    )
                  ],
                ),
              ),
              buildTipsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
