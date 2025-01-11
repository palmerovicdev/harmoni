import 'package:flutter/material.dart';

import '../core/helpers/utils.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    safePrint('didPush: $route from($previousRoute)');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    safePrint('didPop: $route from($previousRoute)');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    safePrint('didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    safePrint('didReplace: $newRoute for($oldRoute)');
  }
}
