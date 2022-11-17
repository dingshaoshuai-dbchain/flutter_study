import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/widgets/my_tab_bar.dart';
import 'package:youliao/widgets/plan_item_list.dart';

import '../../dss_library/util/font_weiget_util.dart';
import '../../dss_library/util/log_utils.dart';
import '../../dss_library/util/toast_util.dart';
import '../../dss_library/widgets/app_bar_widget.dart';
import '../../dss_library/widgets/basis/container_widget.dart';
import '../../dss_library/widgets/basis/image_widget.dart';
import '../../dss_library/widgets/basis/text_compose_widget.dart';
import '../../dss_library/widgets/basis/text_widget.dart';
import '../../dss_library/widgets/gaps.dart';

class ExpertIndexPage extends StatefulWidget {
  const ExpertIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpertIndexPageState();
}

class _ExpertIndexPageState extends State<ExpertIndexPage>
    with TickerProviderStateMixin {
  final List<String> _titles = [];
  final List<Widget> _pages = [];
  late final TabController _pageController;

  @override
  void initState() {
    super.initState();
    _titles.clear();
    _pages.clear();
    _titles.add('准确率排序');
    _pages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _titles.add('连红排序');
    _pages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _pageController = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Log.d('build - ExpertIndexPage');
    return Stack(
      children: [
        ImageWidget(
          url: 'bg_expert_top',
          width: 1.sw,
          height: 290.h,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            AppBarWidget(
              title: '专家',
              titleColor: Colors.white,
              titleFontSize: 18.sp,
              backgroundColor: Colors.transparent,
              isShowBack: false,
              isBlackStatusFontColor: false,
            ),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: _RecommendExpertWidget(),
                    ),
                    SliverPersistentHeader(
                      // 滑动到可视区域顶部时，是否固定在顶部
                      pinned: true,
                      // pinned 为 false 时（可滑动出可视区域），无论多远一拉，都能拉回来
                      // 注意：测试 CustomScrollView 才生效，具体原因后面再看
                      floating: true,
                      delegate: SliverHeaderDelegate.fixedHeight(
                        height: 50.w,
                        child: MyTabBar(
                          pageController: _pageController,
                          titles: _titles,
                        ),
                      ),
                    ),
                  ];
                },
                body: ContainerWidget(
                  backgroundColor: AppColors.mainBackground,
                  child: TabBarView(
                    controller: _pageController,
                    children: _pages,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

/// 顶部推荐专家
class _RecommendExpertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        Gaps.vGap13,
        _buildBody(context),
        Gaps.vGap14,
      ],
    );
  }

  /// 标题区域
  Widget _buildTitle(BuildContext context) {
    return Row(
      children: [
        TextComposeWidget(
          text: '推荐专家',
          textColor: Colors.white,
          fontSize: 16.sp,
          marginLeft: 20.w,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
          leftWidget: ImageWidget(
            url: 'ic_recommend_expert',
            width: 14.w,
            height: 14.w,
            marginRight: 4.5.w,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(),
        TextWidget(
          text: '更多专家 >',
          textColor: AppColors.summaryText2,
          fontSize: 10.sp,
          paddingHorizontal: 14.w,
          paddingVertical: 5.w,
          onPressed: () {
            Toast.show('更多专家');
          },
        ),
      ],
    );
  }

  /// 列表区域
  Widget _buildBody(BuildContext context) {
    return SizedBox(
      // TODO 屏幕适配问题，高度这样搞不靠谱
      height: 138.h,
      child: ListView.separated(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, index, 20);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gaps.hGap10;
        },
      ),
    );
  }

  /// 专家列表 item
  Widget _buildItem(BuildContext context, int index, int count) {
    double? marginLeft = index == 0 ? 12.5.w : null;
    double? marginRight = index == count - 1 ? 12.5.w : null;
    return ContainerWidget(
      width: 97.w,
      backgroundColor: Colors.white,
      radius: 8.w,
      marginLeft: marginLeft,
      marginRight: marginRight,
      child: Column(
        children: [
          Gaps.vGap10,
          Stack(
            alignment: Alignment.center,
            children: [
              ImageWidget(
                url: 'ic_default_avatar',
                width: 57.w,
                height: 57.w,
                marginBottom: 8.w,
                onPressed: () {
                  Toast.show('点击了专家');
                },
              ),
              Positioned(
                bottom: 2.w,
                left: 8.w,
                right: 8.w,
                child: TextWidget(
                  text: '资深专家',
                  textColor: Colors.white,
                  fontSize: 8.sp,
                  width: 42.w,
                  paddingVertical: 1.w,
                  radius: 2.w,
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.w,
                      strokeAlign: StrokeAlign.outside),
                  backgroundColor: AppColors.main,
                ),
              )
            ],
          ),
          TextWidget(
            text: '哥只是个传说',
            textColor: AppColors.mainText,
            fontSize: 12.sp,
            fontWeight: FontWeightUtil.pingFangSCSemibold,
            marginHorizontal: 2.w,
            marginTop: 2.w,
          ),
          TextWidget(
            text: '平台人气王',
            textColor: AppColors.summaryText2,
            fontSize: 8.sp,
            marginTop: 5.w,
          ),
          ImageWidget(
            url: 'ic_expert_attention',
            width: 35.w,
            height: 20.w,
            marginTop: 6.w,
            onPressed: () {
              Toast.show('关注专家');
            },
          ),
          Gaps.vGap8,
        ],
      ),
    );
  }
}
