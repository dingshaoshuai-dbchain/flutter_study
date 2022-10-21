import 'package:flutter/material.dart';
import 'package:youliao/widgets/round_container.dart';

class TaskCenterPage extends StatefulWidget {
  const TaskCenterPage({super.key});

  @override
  State<StatefulWidget> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {
  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      backgroundColor: Colors.red,
      child: Text('data'),
    );
  }
}
