import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIndexPage extends StatefulWidget {
  const MyIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("我的"),
    );
  }
}
