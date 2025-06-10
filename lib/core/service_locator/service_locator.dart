import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:harmoni/core/connection/connection.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/core/helpers/logger.dart';
import 'package:harmoni/features/home/data/api/home_api.dart';
import 'package:harmoni/features/home/data/repository/home_repository.dart';
import 'package:harmoni/features/home/service/home_service.dart';
import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';

import '../../features/my_profile/model/model/user_model.dart';
import '../../features/my_profile/presentation/widget/gender_selection_widget.dart';
import '../../generated/assets.dart';

final locator = GetIt.instance;

var helpInformation = {};

setUpLocator() async {
  await deleteDb();
  locator.registerSingleton<Database>(Database());
  locator.registerSingleton<Connection>(Connection());

  registerServices();
  // setupInitialMockData();
}

loadAllInformation() async {
  var general = jsonDecode(await rootBundle.loadString(Assets.helpInformationGeneral));
  helpInformation = <String, dynamic>{
    'general': general['questions'],
  };
  logI('Values for help information: ${jsonEncode(helpInformation)}');
}

void setupInitialMockData() async {
  getMyProfileRepository().signUp(
    User(
      name: 'Victor',
      age: 20,
      gender: Gender.male.name,
      email: 'pal@gmail.com',
      password: 'detergen',
    ),
  );
}

void registerServices() {
  locator.registerSingleton<MyProfileApi>(MyProfileApiBackImpl());
  locator.registerSingleton<MyProfileRepository>(MyProfileRepositoryImpl(usersApi: getMyProfileApi()));
  locator.registerSingleton<MyProfileService>(MyProfileService(myProfileRepository: getMyProfileRepository()));
  locator.registerSingleton<HomeApi>(HomeApiImpl(connection: getDatabaseService()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(homeApi: getHomeApi()));
  locator.registerSingleton<HomeService>(HomeService(homeRepository: getHomeRepository()));
}

Database getDatabaseService() => locator<Database>();

Connection getConnectionService() => locator<Connection>();

MyProfileApi getMyProfileApi() => locator<MyProfileApi>();

MyProfileRepository getMyProfileRepository() => locator<MyProfileRepository>();

MyProfileService getMyProfileService() => locator<MyProfileService>();

HomeApi getHomeApi() => locator<HomeApi>();

HomeRepository getHomeRepository() => locator<HomeRepository>();

HomeService getHomeService() => locator<HomeService>();
