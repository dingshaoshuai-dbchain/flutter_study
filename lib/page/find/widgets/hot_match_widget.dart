import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class _HotMatchWidgetState extends State<HotMatchWidget> {
  @override
  Widget build(BuildContext context) {
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
            '今日精选10场赛事',
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
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gaps.vLine();
        },
      ),
    );
  }

  /// 精选赛事 item
  Widget _buildItem(BuildContext context) {
    return ContainerWidget(
      width: 154.w,
      onPressed: () {
        Toast.show('跳转赛事详情');
      },
      child: Column(
        children: [
          _buildMatch(context),
          const Spacer(),
          _buildTeam(context),
          const Spacer(),
          _buildTeam(context),
          const Spacer(),
        ],
      ),
    );
  }

  /// 赛事信息 - 名称、时间..
  Widget _buildMatch(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: '澳超',
          textColor: AppColors.mainText,
          fontSize: 10.sp,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
          marginLeft: 9.w,
          marginTop: 7.w,
          marginRight: 3.w,
        ),
        Expanded(
          child: TextWidget(
            text: '05.17 00:00',
            textColor: AppColors.summaryText2,
            marginTop: 7.w,
            fontSize: 10.sp,
            alignment: Alignment.centerLeft,
          ),
        ),
        SizedBox(
          width: 48.w,
          height: 16.w,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned(
                left: 6.w,
                right: 0,
                child: TextWidget(
                  text: '10方案',
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
        ),
      ],
    );
  }

  /// 队伍信息
  Widget _buildTeam(BuildContext context) {
    return Row(
      children: [
        ImageWidget(
          url: 'ic_default_avatar',
          width: 18.w,
          height: 18.w,
          marginLeft: 9.w,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 2.w),
            child: Text(
              '亚特兰大',
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
