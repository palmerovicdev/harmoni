import 'package:dio/dio.dart';
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
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(User user) {
    var connection = getConnectionService();
    return connection.post(
      '$_userBaseUrl/signUp',
      data: user.toJson()..addAll({'role': 'USER'}),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  @override
  Future<void> signIn(User user) {}
}
