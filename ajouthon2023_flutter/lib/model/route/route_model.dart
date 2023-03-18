import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/extension.dart';
import '../../constant/getx/get_model.dart';
import '../../constant/routes.dart';
import '../../constant/util.dart';

class RouteModel extends GetModel {
  const RouteModel({
    required this.navigatorId,
    required this.routes,
    required this.title,
    required this.icon,
  });

  final int navigatorId;
  final Routes routes;
  final String title;
  final String icon;

  static const RouteModel _empty = RouteModel(
    navigatorId: 0,
    routes: Routes.empty,
    title: '',
    icon: '',
  );

  static final RouteModel _main = _empty.copyWith(
    navigatorId: randomInt,
    routes: Routes.main,
  );

  static final RouteModel _intro = _empty.copyWith(
    navigatorId: randomInt,
    routes: Routes.intro,
  );

  static final RouteModel _check = _empty.copyWith(
    navigatorId: randomInt,
    routes: Routes.check,
  );

  static final RouteModel _courseAdd = _empty.copyWith(
    navigatorId: randomInt,
    routes: Routes.courseAdd,
  );

  static final RouteModel _courseList = _empty.copyWith(
    navigatorId: randomInt,
    routes: Routes.courseList,
  );

  factory RouteModel.empty() => _empty;

  factory RouteModel.main() => _main;

  factory RouteModel.courseAdd() => _courseAdd;

  factory RouteModel.courseList() => _courseList;

  factory RouteModel.intro() => _intro;

  factory RouteModel.check() => _check;

  @override
  bool get isEmpty => this == _empty;

  bool get isBinding => routes.entry?.value is Bindings;

  Widget get widget => page.call();

  WidgetFunc get page => (routes.entry?.key).elvis;

  Bindings? get binding => routes.entry?.value;

  Navigator getNavigator({int? navigatorId, Iterable<dynamic>? arguments}) => Navigator(
        key: navigatorId is int ? Get.nestedKey(navigatorId) : null,
        observers: [GetObserver((_) {}, Get.routing)],
        initialRoute: routes.name,
        onGenerateRoute: (settings) => onGenerateRoute(settings, arguments: [...?arguments, navigatorId]),
      );

  @override
  RouteModel copyWith({
    int? navigatorId,
    Routes? routes,
    String? title,
    String? icon,
  }) {
    return RouteModel(
      navigatorId: navigatorId ?? this.navigatorId,
      routes: routes ?? this.routes,
      title: title ?? this.title,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [navigatorId, routes, title, icon];

  @override
  String toString() => 'navigatorId: $navigatorId routes: $routes title: $title icon: $icon';
}
