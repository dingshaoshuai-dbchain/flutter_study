import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/my/login/password_login_page.dart';
import 'package:youliao/page/my/login/phone_login_page.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/navigator_util.dart';
import 'package:youliao/widgets/app_bar_common.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/gaps.dart';

import '../../../util/toast_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  List<String> titles = [];
  List<Widget> pages = [];

  bool _checkboxSelected = false;
  late final TabController _pageController;

  @override
  void initState() {
    super.initState();
    titles.add('手机登录');
    pages.add(const KeepAliveWrapper(child: PhoneLoginPage()));
    titles.add('账号登录');
    pages.add(const KeepAliveWrapper(child: PasswordLoginPage()));

    _pageController = TabController(length: pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: '',
        isShowBack: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            url: 'app/ic_close_black',
            width: 80.w,
            height: 80.w,
            padding: 28.w,
            onPressed: () => {NavigatorUtil.pop(context)},
          ),
          ContainerWidget(
            marginTop: 20.w,
            marginLeft: 12.w,
            child: TabBar(
                controller: _pageController,
                labelColor: AppColors.color_181818,
                unselectedLabelColor: AppColors.color_999999,
                indicatorColor: Colors.transparent,
                // 坑爹玩意，只有设置了这个才会包裹内容显示tab
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                labelStyle:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                tabs: titles.map((e) => Text(e)).toList()),
          ),
          Gaps.vGapValue(30),
          Expanded(
            child: TabBarView(
              controller: _pageController,
              children: pages,
            ),
          ),
          _buildBottom(context),
          Gaps.vGapValue(28)
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          url: _checkboxSelected
              ? 'app/ic_checkbox_checked'
              : 'app/ic_checkbox_normal',
          width: 23.w,
          height: 23.w,
          padding: 5.w,
          onPressed: (){
            setState(() {
              _checkboxSelected = !_checkboxSelected;
            });
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '登录代表您同意《',
                  style: TextStyle(
                    color: AppColors.color_999999,
                    fontSize: 12.sp,
                  )),
              TextSpan(
                text: '用户协议',
                style: TextStyle(color: AppColors.main, fontSize: 12.sp),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Toast.show('用户协议');
                  },
              ),
              TextSpan(
                  text: '》和《',
                  style: TextStyle(
                    color: AppColors.color_999999,
                    fontSize: 12.sp,
                  )),
              TextSpan(
                  text: '隐私协议',
                  style: TextStyle(color: AppColors.main, fontSize: 12.sp),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Toast.show('隐私协议');
                    }),
              TextSpan(
                  text: '》',
                  style: TextStyle(
                    color: AppColors.color_999999,
                    fontSize: 12.sp,
                  )),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
