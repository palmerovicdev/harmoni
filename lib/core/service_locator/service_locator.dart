import 'package:get_it/get_it.dart';
import 'package:harmoni/core/connection/connection.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';

final locator = GetIt.instance;

setUpLocator() {
  locator.registerSingleton<Database>(Database());
  locator.registerSingleton<Connection>(Connection());

  registerServices();
}

void registerServices() {
  locator.registerSingleton<MyProfileApi>(MyProfileApiDBImpl(connection: getDatabaseService()));
  locator.registerSingleton<MyProfileRepository>(MyProfileRepositoryImpl(usersApi: getMyProfileApi()));
  locator.registerSingleton<MyProfileService>(MyProfileService(myProfileRepository: getMyProfileRepository()));
}

Database getDatabaseService() => locator<Database>();
Connection getConnectionService() => locator<Connection>();
MyProfileApi getMyProfileApi() => locator<MyProfileApi>();
MyProfileRepository getMyProfileRepository() => locator<MyProfileRepository>();
MyProfileService getMyProfileService() => locator<MyProfileService>();
