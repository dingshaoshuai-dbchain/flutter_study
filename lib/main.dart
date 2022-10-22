import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    // 状态栏透明
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}




