import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/basis/text_widget.dart';

void main() {
  runApp(const ProviderTestApp());
}

class ProviderTestApp extends StatelessWidget {
  const ProviderTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NumberProvider(),
      builder: (_, __) {
        return const MaterialApp(
          home: ProviderTestHome(),
        );
      },
    );
  }
}

class NumberProvider extends ChangeNotifier {
  int _number = 0;

  String get number => '$_number';

  void change() {
    _number++;
    notifyListeners();
  }
}

class ProviderTestHome extends StatelessWidget {
  const ProviderTestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试'),
      ),
      body: Column(
        children: [
          TextWidget(
            text: context.watch<NumberProvider>().number,
            textColor: Colors.red,
            fontSize: 20,
          ),
          ElevatedButton(
              onPressed: () => {context.read<NumberProvider>().change()},
              child: const Text('自增')),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RedPage()))
                  },
              child: const Text('跳转另一个-读取界面'))
        ],
      ),
    );
  }
}

class RedPage extends StatelessWidget {
  const RedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("读取界面"),
      ),
      body: TextWidget(
        text: context.watch<NumberProvider>().number,
        textColor: Colors.red,
        fontSize: 20,
      ),
    );
  }
}
