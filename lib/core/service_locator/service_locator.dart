import 'package:get_it/get_it.dart';
import 'package:harmoni/core/connection/connection.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';

final locator = GetIt.instance;

setUpLocator() {
  locator.registerSingleton<Database>(Database());
  locator.registerSingleton<Connection>(Connection());

  registerServices();
}

void registerServices() {
  locator.registerSingleton<MyProfileService>(MyProfileService()..init());
}

Database getDatabaseService() => locator<Database>();
Connection getConnectionService() => locator<Connection>();
MyProfileService getMyProfileService() => locator<MyProfileService>();
