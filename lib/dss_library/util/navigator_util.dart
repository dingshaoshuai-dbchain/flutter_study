import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

typedef NetSuccessCallback<T> = Function(String targetPath, String loginPath);

class NavigatorUtil {
  NavigatorUtil._();

  static FluroRouter? _router;

  static String _loginPagePath = '';
  /// dart 中不知道怎么使用返回值函数，暂先用 wrapper 包裹修改
  static Function(PathWrapper pathWrapper, String loginPath)? _checkLoginBlock;

  static void init(
    FluroRouter router,
    String loginPagePath,
    Function(PathWrapper targetPath, String loginPath)? checkLoginBlock,
  ) {
    _router = router;
    _loginPagePath = loginPagePath;
    _checkLoginBlock = checkLoginBlock;
  }

  static void push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool checkLogin = false,
    Object? arguments,
  }) {
    PathWrapper pagePath = PathWrapper(path);
    if (checkLogin) {
      _checkLoginBlock?.call(pagePath, _loginPagePath);
    }
    _router?.navigateTo(
      context,
      pagePath.path,
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
