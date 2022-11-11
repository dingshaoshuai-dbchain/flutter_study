import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/match/basketball_match_index_page.dart';
import 'package:youliao/page/match/football_match_index_page.dart';
import 'package:youliao/page/match/hot_match_index_page.dart';
import 'package:youliao/widgets/gaps.dart';

import '../../res_app/app_colors.dart';
import '../../widgets/basis/container_widget.dart';

class MatchIndexPage extends StatefulWidget {
  const MatchIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MatchIndexPageState();
}

class _MatchIndexPageState extends State<MatchIndexPage>
    with TickerProviderStateMixin {
  final List<String> _titles = [];
  final List<Widget> _pages = [];
  late final TabController _pageController;

  @override
  void initState() {
    super.initState();
    _titles.clear();
    _pages.clear();
    _titles.add('热门');
    _pages.add(const KeepAliveWrapper(child: HotMatchIndexPage()));
    _titles.add('足球');
    _pages.add(const KeepAliveWrapper(child: FootballMatchIndexPage()));
    _titles.add('篮球');
    _pages.add(const KeepAliveWrapper(child: BasketballMatchIndexPage()));
    _pageController = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print("build - MatchIndexPage");
    return Column(
      children: [
        _TabBar(pageController: _pageController, titles: _titles),
        Expanded(
          child: TabBarView(
            controller: _pageController,
            children: _pages,
          ),
        ),
      ],
    );
  }
}

class _TabBar extends StatelessWidget implements PreferredSizeWidget {
  const _TabBar({
    required this.pageController,
    required this.titles,
  });

  final TabController pageController;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    Widget content = ContainerWidget(
      width: double.infinity,
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ContainerWidget(
              marginVertical: 10.w,
              width: 190.w,
              height: 28.w,
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
              radius: 5.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  TabBar(
                    controller: pageController,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelColor: AppColors.main,
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorColor: AppColors.main,
                    indicator: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                        color: AppColors.main),
                    indicatorSize: TabBarIndicatorSize.tab,
                    // 坑爹玩意，只有设置了这个为 true 才会包裹内容显示tab
                    isScrollable: false,
                    tabs: titles.map((e) => Text(e)).toList(),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Gaps.vLine(color: AppColors.main, thickness: 1),
                      const Spacer(),
                      Gaps.vLine(color: AppColors.main, thickness: 1),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    // 有这个玩意，才会自动把状态栏高度空出来
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: content,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
