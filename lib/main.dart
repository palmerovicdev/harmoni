import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/features/home/presentation/state_management/home_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/gender_selection/gender_selection_cubit.dart';
import 'package:harmoni/features/settings/presentation/state_management/security_setting/security_setting_cubit.dart';
import 'package:harmoni/features/settings/presentation/state_management/style_setting/style_setting_cubit.dart';
import 'package:harmoni/router/router.dart';

import 'core/helpers/logger.dart';
import 'core/service_locator/service_locator.dart';
import 'features/my_profile/presentation/state_management/age/age_cubit.dart';
import 'features/my_profile/presentation/state_management/init/init_cubit.dart';
import 'features/my_profile/presentation/state_management/my_profile_setting/my_profile_setting_cubit.dart';
import 'features/my_profile/presentation/state_management/name_setting/name_setting_cubit.dart';
import 'features/my_profile/presentation/state_management/sign_in/sign_in_cubit.dart';
import 'features/my_profile/presentation/state_management/sign_up/sign_up_cubit.dart';
import 'features/settings/presentation/state_management/account_setting/account_setting_cubit.dart';
import 'features/settings/presentation/state_management/change_password_setting/password_change_setting_cubit.dart';
import 'features/settings/presentation/state_management/help_setting/help_setting_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await init();
  await loadAllInformation();
  runApp(const Harmoni());
  logI('App Start');
}

List<CameraDescription> cameras = <CameraDescription>[];

init() async => await setUpLocator();

class Harmoni extends StatelessWidget {
  const Harmoni({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocs(),
      child: BlocBuilder<StyleSettingCubit, StyleSettingState>(
        buildWhen: (previous, current) {
          var previousBrightness = (previous as StyleSettingInitial).brightness;
          var previousColor = previous.color;
          var previousContrast = previous.contrastLevel;
          var previousEmojiType = previous.emojiType;

          var currentBrightness = (current as StyleSettingInitial).brightness;
          var currentColor = current.color;
          var currentContrast = current.contrastLevel;
          var currentEmojiType = current.emojiType;

          return previousBrightness != currentBrightness || previousColor != currentColor || previousContrast != currentContrast || previousEmojiType != currentEmojiType;
        },
        builder: (context, state) {
          return MaterialApp.router(
            theme: theme(state),
            title: 'Harmoni',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }

  blocs() {
    return [
      BlocProvider(create: (context) => HomeCubit()),
      BlocProvider(create: (context) => InitCubit()),
      BlocProvider(create: (context) => SignUpCubit()),
      BlocProvider(create: (context) => SignInCubit()),
      BlocProvider(create: (context) => NameSettingCubit()),
      BlocProvider(create: (context) => AgeCubit()),
      BlocProvider(create: (context) => GenderSelectionCubit()),
      BlocProvider(create: (context) => MyProfileSettingCubit()),
      BlocProvider(create: (context) => AccountSettingCubit()),
      BlocProvider(create: (context) => SecuritySettingCubit()),
      BlocProvider(create: (context) => ChangePasswordSettingCubit()),
      BlocProvider(create: (context) => StyleSettingCubit()),
      BlocProvider(create: (context) => HelpSettingCubit()),
    ];
  }

  theme(StyleSettingState state) {
    return (state as StyleSettingInitial).brightness == Brightness.dark
        ? ThemeData.dark(
            useMaterial3: true,
          ).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: state.color,
              brightness: Brightness.dark,
              contrastLevel: state.contrastLevel,
            ),
          )
        : ThemeData.light(
            useMaterial3: true,
          ).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: state.color,
              brightness: Brightness.light,
              contrastLevel: state.contrastLevel,
            ),
          );
  }
}
