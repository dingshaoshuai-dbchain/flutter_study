import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictIndexPage extends StatefulWidget {
  const PredictIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PredictIndexPageState();
}

class _PredictIndexPageState extends State<PredictIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - PredictIndexPage");
    return const Center(
      child: Text("预测"),
    );
  }
}
