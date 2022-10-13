import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpertIndexPage extends StatefulWidget {
  const ExpertIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpertIndexPageState();
}

class _ExpertIndexPageState extends State<ExpertIndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("专家"),
    );
  }
}
