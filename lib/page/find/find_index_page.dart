import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/find/widgets/hot_match_widget.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/widgets/banner_widget.dart';
import 'package:youliao/widgets/plan_item_list.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
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
                    const HotMatchWidget(),
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
              pinned: true,
              // pinned 为 false 时（可滑动出可视区域），无论多远一拉，都能拉回来
              // 注意：测试 CustomScrollView 才生效
              floating: true,
              delegate: SliverHeaderDelegate.fixedHeight(
                height: 30.w,
                child: _PlanListTitle(),
              ),
            ),
          ];
        },
        body: const PlanItemListWidget(
          type: 4,
        ),
      ),
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
