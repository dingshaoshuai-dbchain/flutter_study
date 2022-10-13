import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchIndexPage extends StatefulWidget {
  const MatchIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MatchIndexPageState();
}

class _MatchIndexPageState extends State<MatchIndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; // 是否需要缓存

  @override
  Widget build(BuildContext context) {
    print("build - MatchIndexPage");
    return const Center(
      child: Text("比分"),
    );
  }
}
