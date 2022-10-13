import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("首页"),
    );
  }
}
