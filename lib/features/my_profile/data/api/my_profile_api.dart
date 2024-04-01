import 'package:harmoni/core/connection/connection.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileApi {
  Future<void> signUp(User user);
  Future<void> signIn(User user);

  Future<User?> getUserProfile();

}

class MyProfileApiBackImpl implements MyProfileApi {
  final String _myProfileBaseUrl = '${getConnectionService().getBaseUrl()}/myProfile';
  final String _userBaseUrl = '${getConnectionService().getBaseUrl()}/user';

  @override
  Future<User?> getUserProfile() {
    var connection = getConnectionService();

  }

  @override
  Future<void> signUp(User user) {
    // TODO: implement saveUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(User user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
