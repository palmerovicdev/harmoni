import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/features/home/presentation/state_management/home_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/gender_selection/gender_selection_cubit.dart';
import 'package:harmoni/router/router.dart';

import 'core/helpers/logger.dart';
import 'core/service_locator/service_locator.dart';
import 'features/my_profile/presentation/state_management/age/age_cubit.dart';
import 'features/my_profile/presentation/state_management/init/init_cubit.dart';
import 'features/my_profile/presentation/state_management/name_setting/name_setting_cubit.dart';
import 'features/my_profile/presentation/state_management/sign_in/sign_in_cubit.dart';
import 'features/my_profile/presentation/state_management/sign_up/sign_up_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const Harmoni());
  logI('App Start');
}

init() => setUpLocator();

class Harmoni extends StatelessWidget {
  const Harmoni({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => InitCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => NameSettingCubit()),
        BlocProvider(create: (context) => AgeCubit()),
        BlocProvider(create: (context) => GenderSelectionCubit()),
      ],
      child: MaterialApp.router(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
