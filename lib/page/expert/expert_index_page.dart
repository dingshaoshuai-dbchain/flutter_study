import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/expert/widgets/recommend_expert_widget.dart';
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
    _pages.add(const KeepAliveWrapper(
      child: PlanItemListWidget(
        sortValue: 3,
      ),
    ));
    _titles.add('连红排序');
    _pages.add(const KeepAliveWrapper(
      child: PlanItemListWidget(
        sortValue: 5,
      ),
    ));
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
                      child: RecommendExpertWidget(),
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
