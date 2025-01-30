import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/features/home/presentation/state_management/home_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/age/age_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/gender_selection/gender_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/init/init_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/name_setting/name_setting_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/sign_in/sign_in_bloc.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/sign_up/sign_up_bloc.dart';
import 'package:harmoni/router/router.dart';

import 'core/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const Harmoni());
}

init() => setUpLocator();

class Harmoni extends StatelessWidget {
  const Harmoni({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => InitBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => NameSettingBloc()),
        BlocProvider(create: (context) => AgeBloc()),
        BlocProvider(create: (context) => GenderBloc()),
      ],
      child: MaterialApp.router(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
