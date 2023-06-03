import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/common/not_found_page.dart';
import '../pages/sing_page.dart';
import '../pages/dance_page.dart';
import '../pages/rap_page.dart';
import '../pages/basketball_page.dart';

var onGenerateRoute = (RouteSettings settings) {
  // DYRoute()._channel.invokeMethod<void>("jumpScheme", {"url": settings.name});
  // return null;
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

  late MethodChannel _channel;

  // 静态变量
  static final DYRoute _route = DYRoute._internal();

  factory DYRoute() {
    return _route;
  }

  DYRoute._internal() {
    _channel = const MethodChannel('multiple-flutters');
  }

  void pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    debugPrint("你干嘛 - $_channel");
    _channel.invokeMethod<void>("jumpScheme", {"url": routeName});
    //return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }
}

typedef RouteBuilder = Widget Function(BuildContext context, Map<String, dynamic>? arguments);
final Map<String, RouteBuilder> _routes = {
  DYRoute.sing: (context, arguments) => const SingPage(),
  DYRoute.dance: (context, arguments) => const DancePage(),
  DYRoute.rap: (context, arguments) => const RapPage(),
  DYRoute.basketball: _routeBasketballPage,
};

Widget _routeBasketballPage(BuildContext context, Map<String, dynamic>? arguments) {
  final parameter = arguments?['text'] ?? '';
  return BasketballPage(parameter: parameter);
}
