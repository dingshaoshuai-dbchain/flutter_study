import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIndexPage extends StatefulWidget {
  const MyIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;// 是否需要缓存

  @override
  Widget build(BuildContext context) {
    print("build - MyIndexPage");
    return const Center(
      child: Text("我的"),
    );
  }
}
