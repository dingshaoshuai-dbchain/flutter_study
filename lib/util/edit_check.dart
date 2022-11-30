import 'package:common_utils/common_utils.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';

bool checkPhone(String phone) {
  if (!RegexUtil.isMobileSimple(phone)) {
    Toast.show('请填写正确的手机号');
    return true;
  }
  return false;
}

bool checkSmsCode(String smsCode) {
  if (smsCode.length < 6) {
    Toast.show('请填写正确的验证码');
    return true;
  }
  return false;
}
