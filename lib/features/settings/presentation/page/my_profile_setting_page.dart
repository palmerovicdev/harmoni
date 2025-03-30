import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/my_profile_setting/my_profile_setting_cubit.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../generated/assets.dart';
import '../widget/setting_action_widget.dart';

class MyProfileSettingPage extends StatelessWidget {
  const MyProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    return BlocBuilder<MyProfileSettingCubit, MyProfileSettingState>(
      builder: (context, state) {
        double size = 36;
        var data = [
          {
            "title": "Seguridad",
            "subtitle": null,
            "icon": Icon(
              Icons.security,
              size: size,
              color: color,
            ),
            "iconSize": size,
            "color": color,
            "action": null,
            "onPressed": () {
              context.pushNamed(MyProfileRoute.security.data.name);
            },
          },
          {
            "title": "Apariencia",
            "subtitle": null,
            "icon": Icon(
              Icons.color_lens,
              size: size,
              color: color,
            ),
            "iconSize": size,
            "color": color,
            "action": null,
            "onPressed": () {
              context.pushNamed(MyProfileRoute.style.data.name);
            },
          },
          {
            "title": "Ayuda",
            "subtitle": null,
            "icon": Icon(
              Icons.help,
              size: size,
              color: color,
            ),
            "iconSize": size,
            "color": color,
            "action": null,
            "onPressed": () {
              context.pushNamed(MyProfileRoute.help.data.name);
            },
          },
          {
            "title": "Cerrar cuenta",
            "subtitle": null,
            "icon": Icon(
              Icons.close,
              size: size,
              color: Colors.red.withOpacity(0.8),
            ),
            "iconSize": size,
            "action": Icon(
              Icons.logout_rounded,
              size: size,
              color: Colors.red.withOpacity(0.8),
            ),
            "color": Colors.red,
            "onPressed": () async {
              var shouldContinue = false;
              if ((getMyProfileService().userProfile?.settings?[SettingsEnums.shouldShowLogOutDialog.name] as bool?) ?? true) {
                await showConditionalDialog(
                  context,
                  'Esta seguro de querer salir?',
                  onAcceptPressed: () => shouldContinue = true,
                );
              } else {
                shouldContinue = true;
              }
              if (!shouldContinue) return;
              if (context.mounted) {
                context.read<MyProfileSettingCubit>().signOut();
                context.goNamed(HomeRoute.home.data.name);
              }
            },
          }
        ];

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.small.gap,
                Center(
                  child: SvgPicture.asset(
                    Assets.coreCog1,
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
                      size: 60,
                    ),
                    "iconSize": 60,
                    "color": color,
                    "action": null,
                    "onPressed": () {
                      context.pushNamed(MyProfileRoute.account.data.name);
                    },
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
