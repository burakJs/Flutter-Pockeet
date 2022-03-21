import 'package:flutter/material.dart';

import '../abstract/navigation_service.dart';

class NavigationManager extends INavigationService {
  static NavigationManager? _instance;
  static NavigationManager get instance => _instance ??= NavigationManager._init();
  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data ?? '');
  }

  @override
  Future<void> navigateToPageClear(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data ?? '');
  }
}
