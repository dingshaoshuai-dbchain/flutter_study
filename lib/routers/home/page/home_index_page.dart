import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; // 是否需要缓存

  @override
  Widget build(BuildContext context) {
    print("build - HomeIndexPage");
    super.build(context);// 缓存必须调用
    return const Center(
      child: Text("首页"),
    );
  }
}
