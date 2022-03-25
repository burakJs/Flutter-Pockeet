import 'package:flutter/material.dart';
import '../../../../feature/navigate/view/navigate_view.dart';
import '../../../../feature/signin-signup/signin_view.dart';
import '../../../../feature/signin-signup/signup_view.dart';

import '../../../constants/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_PAGE:
        return normalNavigate(NavigateView());
      case NavigationConstants.LOGIN_PAGE:
        return normalNavigate(LoginView());
      case NavigationConstants.SIGNUP_PAGE:
        return normalNavigate(SignupView());
      default:
        return normalNavigate(const Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
