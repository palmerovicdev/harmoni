import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/features/home/presentation/page/home_page.dart';
import 'package:harmoni/features/home/presentation/page/home_wrapper_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/age_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/gender_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/init_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/name_setting_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/sign_in_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/sign_up_page.dart';
import 'package:harmoni/features/settings/presentation/page/account_setting_page.dart';
import 'package:harmoni/router/router_observer.dart';

import '../features/my_profile/presentation/page/all_done_page.dart';
import '../features/settings/presentation/page/my_profile_setting_page.dart';
import '../features/settings/presentation/page/security_setting_page.dart';
import 'general_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  restorationScopeId: 'router',
  initialLocation: HomeRoute.home.data.path,
  observers: kDebugMode ? [GoRouterObserver()] : [],
  routes: [
    ShellRoute(
        builder: (context, state, child) => HomeWrapperPage(
              child: child,
            ),
        routes: [
          GoRoute(
            path: HomeRoute.home.data.path,
            name: HomeRoute.home.data.name,
            pageBuilder: (context, state) => MaterialPage(child: HomePage()),
          ),
          GoRoute(
            path: MyProfileRoute.my_profile.data.path,
            name: MyProfileRoute.my_profile.data.name,
            pageBuilder: (context, state) => MaterialPage(child: MyProfileSettingPage()),
          )
        ]),
    GoRoute(
      path: MyProfileRoute.init.data.path,
      name: MyProfileRoute.init.data.name,
      pageBuilder: (context, state) => MaterialPage(child: InitPage()),
    ),
    GoRoute(
      path: MyProfileRoute.signIn.data.path,
      name: MyProfileRoute.signIn.data.name,
      pageBuilder: (context, state) => MaterialPage(child: SignInPage()),
    ),
    GoRoute(
      path: MyProfileRoute.signUp.data.path,
      name: MyProfileRoute.signUp.data.name,
      pageBuilder: (context, state) => MaterialPage(child: SignUpPage()),
    ),
    GoRoute(
      path: MyProfileRoute.name.data.path,
      name: MyProfileRoute.name.data.name,
      pageBuilder: (context, state) => MaterialPage(child: NameSettingPage(isFromSettings: state.extra as bool)),
    ),
    GoRoute(
        path: MyProfileRoute.age.data.path, name: MyProfileRoute.age.data.name, pageBuilder: (context, state) => MaterialPage(child: AgePage(isFromSettings: state.extra as bool))),
    GoRoute(
      path: MyProfileRoute.gender.data.path,
      name: MyProfileRoute.gender.data.name,
      pageBuilder: (context, state) => MaterialPage(child: GenderPage(isFromSettings: state.extra as bool)),
    ),
    GoRoute(
      path: MyProfileRoute.allDone.data.path,
      name: MyProfileRoute.allDone.data.name,
      pageBuilder: (context, state) => MaterialPage(child: AllDonePage()),
    ),
    GoRoute(
      path: MyProfileRoute.account.data.path,
      name: MyProfileRoute.account.data.name,
      pageBuilder: (context, state) => MaterialPage(child: AccountSettingPage()),
    ),
    GoRoute(
      path: MyProfileRoute.security.data.path,
      name: MyProfileRoute.security.data.name,
      pageBuilder: (context, state) => MaterialPage(child: SecuritySettingPage()),
    ),
  ],
);

var routes = [
  HomeRoute.home.data.name,
  MyProfileRoute.init.data.name,
  MyProfileRoute.signIn.data.name,
  MyProfileRoute.signUp.data.name,
  MyProfileRoute.name.data.name,
  MyProfileRoute.age.data.name,
  MyProfileRoute.gender.data.name,
  MyProfileRoute.allDone.data.name,
];
