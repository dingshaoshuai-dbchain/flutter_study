import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

typedef NetSuccessCallback<T> = Function(String targetPath, String loginPath);
typedef ValueFunction = bool Function();

class NavigatorUtil {
  NavigatorUtil._();

  static FluroRouter? _router;

  static String _loginPagePath = '';
  static late ValueFunction _checkLoginFunction;

  static void init({
    required FluroRouter router,
    required String loginPagePath,
    required ValueFunction checkLoginFunction,
  }) {
    _router = router;
    _loginPagePath = loginPagePath;
    _checkLoginFunction = checkLoginFunction;
  }

  static void push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool checkLogin = false,
    Object? arguments,
  }) {
    String page = path;
    if (checkLogin) {
      bool needLogin = _checkLoginFunction();
      if (needLogin) {
        page = _loginPagePath;
      }
    }
    _router?.navigateTo(
      context,
      page,
      replace: replace,
      clearStack: clearStack,
      routeSettings: RouteSettings(arguments: arguments),
    );
  }

  /// 返回
  static void pop<T>(BuildContext context, {T? result}) {
    unFocus();
    Navigator.pop(context, result);
  }

  static void unFocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class PathWrapper {
  PathWrapper(this.path);

  String path;
}
