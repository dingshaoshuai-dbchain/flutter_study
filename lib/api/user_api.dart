
import 'package:dss_base_flutter/dss_base_flutter.dart';

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
  }
}
