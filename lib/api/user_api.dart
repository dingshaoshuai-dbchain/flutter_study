import 'package:youliao/net/http_util.dart';

class UserApi {
  UserApi._();

  static final UserApi _singleton = UserApi._();

  factory UserApi() => _singleton;

  static UserApi get instance => _singleton;

  void loginByPhone(
    String phone,
    String smsCode, {
    String? inviteCode,
    String? ip,
  }) {
    HttpUtil.instance.request('live-passport-api/user/codeLogin');
  }
}