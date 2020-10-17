import 'package:CatchTheGoal/core/constants/navigation/navigation_constant.dart';
import 'package:CatchTheGoal/view/test/view/test_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/card/not_found_navigation_widget.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
