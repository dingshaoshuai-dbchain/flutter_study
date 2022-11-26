import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/util/log_utils.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';
import 'package:youliao/dss_library/widgets/gaps.dart';
import 'package:youliao/res/app_colors.dart';

class TestFutureStream extends StatefulWidget {
  const TestFutureStream({super.key});

  @override
  State<StatefulWidget> createState() => _TestFutureStreamState();
}

class _TestFutureStreamState extends State<TestFutureStream> {
  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 3), () => "网络上获取的数据");
  }

  Future<String> mockErrorData() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => Future.error(''),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: '测试异步'),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _test1(),
            Gaps.vGap20,
            _test2(),
            Gaps.vGap20,
            _testError(),
            Gaps.vGap20,
            _test3(),
          ],
        ),
      ),
    );
  }

  Widget _test1() {
    return FutureBuilder(
      future: mockNetworkData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Log.d('builder - 1');
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return TextWidget(
              text: '请求失败',
              textColor: AppColors.main,
              fontSize: 20.sp,
            );
          } else {
            return TextWidget(
              text: snapshot.data,
              textColor: AppColors.mainText,
              fontSize: 20.sp,
            );
          }
        }
      },
    );
  }

  Widget _test2() {
    return FutureBuilder(
      initialData: "我是默认的数据",
      future: mockNetworkData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Log.d('builder - 2');
        return TextWidget(
          text: snapshot.data,
          textColor: AppColors.mainText,
          fontSize: 20.sp,
        );
      },
    );
  }

  Widget _testError() {
    return FutureBuilder(
      initialData: "我是默认的数据",
      future: mockErrorData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Log.d('builder - 2');
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return TextWidget(
              text: '请求失败',
              textColor: AppColors.main,
              fontSize: 20.sp,
              onPressed: () {
                setState(() {});
              },
            );
          } else {
            return TextWidget(
              text: snapshot.data,
              textColor: AppColors.mainText,
              fontSize: 20.sp,
            );
          }
        }
      },
    );
  }

  Widget _test3() {
    return StreamBuilder(
      stream: counter(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return TextWidget(
            text: '发生了错误${snapshot.error}',
            textColor: AppColors.main,
            fontSize: 20.sp,
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('没有Stream');
          case ConnectionState.waiting:
            return const Text('等待数据');
          case ConnectionState.active:
            return Text('active:${snapshot.data}');
          case ConnectionState.done:
            return const Text('stream 已关闭');
        }
      },
    );
  }
}
