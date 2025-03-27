import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/service_locator/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProfileService = getMyProfileService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (myProfileService.userProfile == null) {
        context.goNamed(MyProfileRoute.init.data.name);
      }
    });
    return Scaffold(
      body: SizedBox(),
    );
  }
}
