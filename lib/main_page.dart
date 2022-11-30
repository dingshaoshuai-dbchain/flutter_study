import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youliao/page/find/find_index_page.dart';
import 'package:youliao/page/test/test_index_page.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'main_provider.dart';
import 'page/expert/expert_index_page.dart';
import 'page/match/match_index_page.dart';
import 'page/my/my_index_page.dart';
import 'page/predict/predict_index_page.dart';
import 'res/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RestorationMixin {
  final _items = <BottomNavigationBarItem>[];
  final _pages = <Widget>[];
  final PageController _pageController = PageController();
  final MainProvider provider = MainProvider();

  @override
  void initState() {
    super.initState();
    _items.add(_buildItem(
      label: "首页",
      normalPath: 'main/ic_tab_find_normal',
      selectedPath: 'main/ic_tab_find_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: FindIndexPage()));

    _items.add(_buildItem(
      label: "专家",
      normalPath: 'main/ic_tab_expert_normal',
      selectedPath: 'main/ic_tab_expert_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: ExpertIndexPage()));

    _items.add(_buildItem(
      label: "预测",
      normalPath: 'main/ic_tab_predict_normal',
      selectedPath: 'main/ic_tab_predict_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: PredictIndexPage()));

    _items.add(_buildItem(
      label: "比分",
      normalPath: 'main/ic_tab_match_normal',
      selectedPath: 'main/ic_tab_match_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: MatchIndexPage()));

    _items.add(_buildItem(
      label: "我的",
      normalPath: 'main/ic_tab_my_normal',
      selectedPath: 'main/ic_tab_my_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: MyIndexPage()));

    _items.add(_buildItem(
      label: "测试",
      normalPath: 'main/ic_tab_my_normal',
      selectedPath: 'main/ic_tab_my_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: TestIndexPage()));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
        create: (_) => provider,
        child: DoubleTapBackExitApp(
            child: Scaffold(
              bottomNavigationBar: Consumer<MainProvider>(
                builder: (_, provider, __) {
                  return BottomNavigationBar(
                backgroundColor: Colors.white,
                items: _items,
                currentIndex: provider.value,
                // flex:文字始终显示 shifting:选中的显示文字
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.main,
                unselectedItemColor: AppColors.summaryText,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                onTap: (index) => _pageController.jumpToPage(index),
              );
            },
          ),
          body: _buildPageView(_pageController, provider, _pages),
        ),
      ),
    );
  }

  /// 底部导航 tab item
  BottomNavigationBarItem _buildItem({
    required String label,
    required String normalPath,
    required String selectedPath,
    double normalSize = 20.0,
    double selectedSize = 20.0,
  }) {
    return BottomNavigationBarItem(
      icon: ImageWidget(url: normalPath, width: normalSize),
      activeIcon: ImageWidget(url: selectedPath, width: selectedSize),
      label: label,
    );
  }

  /// PageView
  Widget _buildPageView(
      PageController controller, MainProvider provider, List<Widget> children) {
    return PageView(
      // 禁止滑动
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (int index) => provider.value = index,
      children: children,
    );
  }

  @override
  String? get restorationId => "main";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
