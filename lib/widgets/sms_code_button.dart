import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';

import '../dss_library/widgets/basis/text_widget.dart';

class SmsCodeButton extends StatefulWidget {
  const SmsCodeButton({
    super.key,
    required this.getSmsCodeF,
  });

  final Future<bool> Function() getSmsCodeF;

  @override
  State<StatefulWidget> createState() => _SmsCodeButtonState();
}

class _SmsCodeButtonState extends State<SmsCodeButton> {
  final Color _normalColor = AppColors.main;
  final Color _countDownColor = const Color(0xFF999999);

  bool _countDowning = false;

  // 倒计时秒数
  final int _totalSecond = 9;
  // 当前秒数
  int _currentSecond = 9;

  StreamSubscription<dynamic>? _subscription;

  Future<dynamic> _getSmsCode() async {
    final bool isSuccess = await widget.getSmsCodeF();
    if (!isSuccess) return;
    setState(() {
      _currentSecond = _totalSecond;
      _countDowning = true;
    });
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(_totalSecond)
        .listen((int i) {
      setState(() {
        _currentSecond = _totalSecond - i - 1;
        _countDowning = _currentSecond > 0;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: _countDowning ? '${_currentSecond}s' : '获取验证码',
      textColor: _countDowning ? _countDownColor : _normalColor,
      fontSize: 11.sp,
      radius: 12.w,
      backgroundColor: const Color(0xFFE8F5E9),
      width: 74.w,
      height: 24.w,
      onPressed: _countDowning ? null : _getSmsCode,
    );
  }
}
