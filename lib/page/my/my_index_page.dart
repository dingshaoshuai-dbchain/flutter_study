import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/button_widget.dart';
import 'package:youliao/widgets_app/AppButton.dart';

class MyIndexPage extends StatefulWidget {
  const MyIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {
  Widget build(BuildContext context) {
    print("build - MyIndexPage");
    return Column(
      children: [
        TextButton(
          onPressed: () => {Toast.show('提示')},
          style: ButtonStyle(
            foregroundColor: ButtonStyleButton.allOrNull(Colors.amberAccent),
            backgroundColor: ButtonStyleButton.allOrNull(Colors.blue),
            side: ButtonStyleButton.allOrNull(BorderSide(
              color: Colors.yellow,
              width: 5,
            )),
            shape: ButtonStyleButton.allOrNull(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            minimumSize: ButtonStyleButton.allOrNull(Size(200, 100)),
            // 水波纹
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white.withOpacity(0.12);
            }),
          ),
          child: Text(
            '按钮',
            style: TextStyle(fontSize: 15, backgroundColor: Colors.red),
          ),
        ),
        ButtonWidget(
          text: '按钮',
          textColor: Colors.yellow,
          fontSize: 15,
          marginTop: 20,
          marginLeft: 20.w,
          height: 100,
          backgroundColor: Colors.blue,
          radius: 30,
          borderSide: BorderSide(color: Colors.yellow, width: 5),
          onPressed: () => {Toast.show('点击')},
        ),
        AppButton(
          text: '登录',
          onPressed: ()=>{
            Toast.show("登录")
          },
        )
      ],
    );
  }
}
