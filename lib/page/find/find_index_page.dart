import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/widgets/banner_widget.dart';

import '../../dss_library/util/font_weiget_util.dart';
import '../../dss_library/util/log_utils.dart';
import '../../dss_library/util/toast_util.dart';
import '../../dss_library/widgets/app_bar_widget.dart';
import '../../dss_library/widgets/basis/container_widget.dart';
import '../../dss_library/widgets/basis/image_widget.dart';
import '../../dss_library/widgets/basis/text_compose_widget.dart';
import '../../dss_library/widgets/basis/text_widget.dart';
import '../../dss_library/widgets/gaps.dart';
import '../../widgets/plan_item.dart';

class FindIndexPage extends StatefulWidget {
  const FindIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindIndexPageState();
}

class _FindIndexPageState extends State<FindIndexPage> {
  @override
  Widget build(BuildContext context) {
    Log.d('build - FindIndexPage');
    return Scaffold(
      appBar: AppBarWidget(title: '发现', isShowBack: false),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 头部区域
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w),
              child: Column(
                children: [
                  Gaps.vGap8,
                  const BannerWidget(
                    aspectRatio: 354 / 150,
                    locationId: 3,
                  ),
                  Gaps.vGap8,
                  _Match(),
                  Gaps.vGap8,
                  _Menu(),
                  Gaps.vGap8,
                ],
              ),
            ),
          ),
          // 头部固定区域
          SliverPersistentHeader(
            // 滑动到可视区域顶部时，是否固定在顶部
            pinned: false,
            // pinned 为 false 时（可滑动出可视区域），无论多远一拉，都能拉回来
            // 注意：测试 CustomScrollView 才生效
            floating: true,
            delegate: SliverHeaderDelegate.fixedHeight(
              height: 30.w,
              child: _PlanListTitle(),
            ),
          ),
          // 列表区域
          SliverPadding(
            padding: EdgeInsets.only(left: 9.w, right: 9.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildPlanItem(context, index),
              ),
            ),
          ),
        ],
      ),
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
            child: _buildItem(context, '不对退返', 'ic_plan_return', () {
              Toast.show('不对退返');
            }),
          ),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '免费专区', 'ic_plan_free', () {
                Toast.show('免费专区');
              })),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '打包专区', 'ic_plan_package', () {
                Toast.show('打包专区');
              })),
          Gaps.hGap5,
          Expanded(
              child: _buildItem(context, '2串1', 'ic_plan_2_and_1', () {
                Toast.show('2串1');
              })),
        ],
      ),
    );
  }

  /// 菜单 item
  Widget _buildItem(BuildContext context,
      String text,
      String iconPath,
      GestureTapCallback onPressed,) {
    return TextComposeWidget(
      text: text,
      textColor: AppColors.mainText,
      fontSize: 12.sp,
      fontWeight: FontWeightUtil.pingFangSCSemibold,
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

/// 红人情报标题
class _PlanListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      paddingHorizontal: 12.w,
      paddingVertical: 5.w,
      backgroundColor: AppColors.mainBackground,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageWidget(
            url: 'ic_hot_plan_list',
            width: 16.w,
            height: 14.w,
            fit: BoxFit.fill,
          ),
          ImageWidget(
            url: 'ic_hot_plan_list_title',
            width: 62.w,
            height: 13.w,
            fit: BoxFit.fill,
            marginLeft: 6.w,
          )
        ],
      ),
    );
  }
}

/// 红人情报方案列表
Widget _buildPlanItem(BuildContext context, int index) {
  return PlanItemWidget(
    marginTop: 10.w,
    marginBottom: index == 30 - 1 ? 10.w : 0.0,
  );
}