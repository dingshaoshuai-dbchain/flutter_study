import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_compose_widget.dart';
import 'package:youliao/widgets/gaps.dart';

import '../../widgets/app_bar_common.dart';
import '../../widgets/basis/text_widget.dart';
import '../../widgets_app/plan_item.dart';

class FindIndexPage extends StatefulWidget {
  const FindIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindIndexPageState();
}

class _FindIndexPageState extends State<FindIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - HomeIndexPage");
    return Scaffold(
      appBar: AppBarCommon(title: '发现', isShowBack: false),
      body: ListView(
        padding: EdgeInsets.only(left: 9.w, right: 9.w),
        children: [
          Gaps.vGapValue(8.w),
          _Banner(),
          Gaps.vGapValue(8.w),
          _Match(),
          Gaps.vGapValue(8.w),
          _Menu(),
          Gaps.vGapValue(8.w),
          _PlanList()
        ],
      ),
    );
  }
}

/// Banner
class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.red,
      height: 105.w,
    );
  }
}

/// 精选赛事
class _Match extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      radius: 8.w,
      child: Column(
        children: [
          SizedBox(
            height: 34.w,
            child: Row(
              children: [
                ImageWidget(
                  url: 'find/ic_hot_match',
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
                  url: 'find/ic_hot_match_calendar',
                  width: 10.w,
                  height: 10.w,
                  marginRight: 3.w,
                ),
                Text(
                  '今日精选10场赛事',
                  style: TextStyle(
                    color: AppColors.color_999999,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          ),
          Gaps.hLine(),
          SizedBox(
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
          ),
        ],
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
          textColor: AppColors.color_181818,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          marginLeft: 9.w,
          marginTop: 7.w,
          marginRight: 3.w,
        ),
        Expanded(
          child: TextWidget(
            text: '05.17 00:00',
            textColor: AppColors.color_999999,
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
                  backgroundColor: AppColors.red_2,
                  paddingLeft: 12.w,
                ),
              ),
              Positioned(
                child: ImageWidget(
                  url: 'find/ic_hot_match_plan',
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
          url: 'app/ic_default_avatar',
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
                color: AppColors.color_181818,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 菜单（不对退返、免费专区..）
class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      radius: 8.w,
      child: Row(
        children: [
          Expanded(
            child: _buildItem(context, '不对退返', 'find/ic_plan_return', () {
              Toast.show('不对退返');
            }),
          ),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '免费专区', 'find/ic_plan_free', () {
            Toast.show('免费专区');
          })),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '打包专区', 'find/ic_plan_package', () {
            Toast.show('打包专区');
          })),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '2串1', 'find/ic_plan_2_and_1', () {
            Toast.show('2串1');
          })),
        ],
      ),
    );
  }

  /// 菜单 item
  Widget _buildItem(
    BuildContext context,
    String text,
    String iconPath,
    GestureTapCallback onPressed,
  ) {
    return TextComposeWidget(
      text: text,
      textColor: AppColors.color_181818,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      marginTop: 10.w,
      marginBottom: 8.w,
      topWidget: ImageWidget(
        url: iconPath,
        width: 34.w,
        height: 34.w,
        marginBottom: 6.w,
      ),
      onPressed: onPressed,
    );
  }
}

/// 方案列表
class _PlanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 3.w,
            right: 3.w,
            top: 8.w,
            bottom: 5.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageWidget(
                url: 'find/ic_hot_plan_list',
                width: 16.w,
                height: 14.w,
                fit: BoxFit.fill,
              ),
              ImageWidget(
                url: 'find/ic_hot_plan_list_title',
                width: 62.w,
                height: 13.w,
                fit: BoxFit.fill,
                marginLeft: 6.w,
              )
            ],
          ),
        ),
        ListView.separated(
          itemCount: 30,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return PlanItemWidget(
              marginTop: index == 0 ? 7.w : 0.0,
              marginBottom: index == 30 - 1 ? 10.w : 0.0,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gaps.vGapValue(8.w);
          },
        )
      ],
    );
  }
}
