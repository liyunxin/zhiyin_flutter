import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/common/not_found_page.dart';
import '../pages/sing_page.dart';
import '../pages/dance_page.dart';
import '../pages/rap_page.dart';
import '../pages/basketball_page.dart';

var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final pageRoute = _routes[settings.name];
  if (pageRoute == null) {
    return MaterialPageRoute(builder: (context) => const NotFoundPage());
  }
  final arguments = settings.arguments as Map<String, dynamic>?;
  return CupertinoPageRoute(builder: (context) {
    return pageRoute(context, arguments);
  });
};

class DYRoute {
  static const String sing = "niganma://sing";
  static const String dance = "niganma://dance";
  static const String rap = "niganma://rap";
  static const String basketball = "niganma://basketball";
}

typedef RouteBuilder = Widget Function(BuildContext context, Map<String, dynamic>? arguments);
final Map<String, RouteBuilder> _routes = {
  DYRoute.sing: (context, arguments) => const SingPage(),
  DYRoute.dance: (context, arguments) => const DancePage(),
  DYRoute.rap: (context, arguments) => const RapPage(),
  DYRoute.basketball: _routeBasketballPage,
};

// 接收一个 BuildContext 参数，并指定 arguments 的类型
Widget _routeBasketballPage(BuildContext context, Map<String, dynamic>? arguments) {
  final parameter = arguments?['text'] ?? '';
  return BasketballPage(parameter: parameter);
}
