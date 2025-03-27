import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/my_profile_setting/my_profile_setting_cubit.dart';

import '../../../../core/widgets/spacer.dart';
import '../../../../generated/assets.dart';
import '../widget/setting_action_widget.dart';

class MyProfileSettingPage extends StatelessWidget {
  const MyProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileSettingCubit, MyProfileSettingState>(
      builder: (context, state) {
        var color = Theme.of(context).colorScheme.primary;

        var data = [
          {
            "title": "Seguridad",
            "subtitle": null,
            "icon": Icon(
              Icons.security,
              size: 32,
              color: color,
            ),
            "iconSize": 32,
            "color": color,
            "action": null,
            "onPressed": () {},
          },
          {
            "title": "Apariencia",
            "subtitle": null,
            "icon": Icon(
              Icons.color_lens,
              size: 32,
              color: color,
            ),
            "iconSize": 32,
            "color": color,
            "action": null,
            "onPressed": () {},
          },
          {
            "title": "Ayuda",
            "subtitle": null,
            "icon": Icon(
              Icons.help,
              size: 32,
              color: color,
            ),
            "iconSize": 32,
            "color": color,
            "action": null,
            "onPressed": () {},
          },
          {
            "title": "Cerrar cuenta",
            "subtitle": null,
            "icon": Icon(
              Icons.close,
              size: 32,
              color: Colors.red.withOpacity(0.8),
            ),
            "iconSize": 32,
            "action": Icon(
              Icons.logout_rounded,
              size: 32,
              color: Colors.red.withOpacity(0.8),
            ),
            "color": Colors.red,
            "onPressed": () {},
          }
        ];

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    Assets.coreCog,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                    height: 140,
                  ),
                ),
                Space.medium.gap,
                ...[
                  {
                    "title": "Cuenta",
                    "subtitle": getMyProfileService().userProfile?.email,
                    "icon": Icon(
                      Icons.account_circle,
                      color: color,
                      size: 56,
                    ),
                    "iconSize": 56,
                    "color": color,
                    "action": null,
                    "onPressed": () {},
                  }
                ].map(
                  (e) => SettingActionWidget(
                    title: e['title'] as String,
                    action: e['action'] as Icon?,
                    leading: e['icon'] as Icon?,
                    color: e['color'] as Color?,
                    onPressed: e['onPressed'] as Function()?,
                    subtitle: e['subtitle'] as String?,
                  ),
                ),
                Space.medium.gap,
                ...data.map(
                  (e) => SettingActionWidget(
                    title: e['title'] as String,
                    action: e['action'] as Icon?,
                    leading: e['icon'] as Icon?,
                    color: e['color'] as Color?,
                    onPressed: e['onPressed'] as Function()?,
                    subtitle: e['subtitle'] as String?,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
