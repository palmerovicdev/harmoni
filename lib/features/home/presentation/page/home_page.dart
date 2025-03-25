import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../generated/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProfileService = getMyProfileService();
    if (myProfileService.userProfile == null) {
      context.goNamed(MyProfileRoute.init.data.name);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              Assets.coreCloudSnow,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                Assets.coreProfileChecked,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(),
    );
  }
}
