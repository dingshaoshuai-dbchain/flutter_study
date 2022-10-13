import 'package:flutter/material.dart';
import 'package:youliao/routers/main_page.dart';
import 'package:youliao/routers/match/page/match_index_page.dart';
import 'package:youliao/routers/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "有料APP",
      home: MainPage(),
    );
  }
}


