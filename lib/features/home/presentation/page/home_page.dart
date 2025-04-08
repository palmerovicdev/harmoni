import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../settings/presentation/state_management/style_setting/style_setting_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProfileService = getMyProfileService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var settings = myProfileService.userProfile?.settings;
      if (myProfileService.userProfile == null) {
        context.goNamed(MyProfileRoute.init.data.name);
      } else if (settings != null && settings['brightness'] != null && settings['color'] != null && settings['contrastLevel'] != null && settings['emojiType'] != null) {
        context.read<StyleSettingCubit>().changeAll(
              brightness: settings['brightness'] == Brightness.dark.name ? Brightness.dark : Brightness.light,
              color: Color(settings['color'] ?? 0),
              contrastLevel: settings['contrastLevel'] ?? 0.0,
              emojiType: settings['emojiType'] ?? 'ghost',
            );
      }
    });
    return Scaffold(
      body: SizedBox(),
    );
  }
}
