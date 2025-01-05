import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:harmoni/router/router_observer.dart';

import 'general_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  restorationScopeId: 'router',
  initialLocation: HomeRoute.home.data.path,
  observers: kDebugMode ? [GoRouterObserver()] : [],
  routes: [
    GoRoute(
      path: HomeRoute.home.data.path,
      name: HomeRoute.home.data.name,
      pageBuilder: (context, state) => MaterialPage(child: Container()),
    ),
  ],
);