import 'package:dio/dio.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileApi {
  Future<void> signUp(User user);

  Future<void> signIn(User user);

  Future<User?> getUserProfile();

  Future<bool?> validateName(String name);

  Future<bool?> validateEmail(String email);
}

class MyProfileApiBackImpl implements MyProfileApi {
  final String _myProfileBaseUrl = '${getConnectionService().getBaseUrl()}/myProfile';
  final String _userBaseUrl = '${getConnectionService().getBaseUrl()}/user';

  @override
  Future<User?> getUserProfile() {
    var connection = getConnectionService();
    return connection
        .get(
      '$_myProfileBaseUrl/getUserProfile',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        // handle error
        return null;
      }
    });
  }

  @override
  Future<void> signUp(User user) async {
    var connection = getConnectionService();
    var response = await connection.post(
      '$_userBaseUrl/signUp',
      data: user.toJson()..addAll({'role': 'USER'}),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      getConnectionService().token = response.data['token'];
    } else {
      // handle error
    }
  }

  @override
  Future<void> signIn(User user) {
    var connection = getConnectionService();
    return connection
        .post(
      '$_userBaseUrl/signIn',
      data: user.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        connection.token = response.data['token'];
      } else {
        // handle error
      }
    });
  }

  @override
  Future<bool?> validateEmail(String email) {
    var connection = getConnectionService();
    return connection
        .post(
      '$_myProfileBaseUrl/validateEmail/$email',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return response.data['isValid'];
      } else {
        // handle error
        return null;
      }
    });
  }

  @override
  Future<bool?> validateName(String name) {
    var connection = getConnectionService();
    return connection
        .post(
      '$_myProfileBaseUrl/validateName/$name',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return response.data['isValid'];
      } else {
        // handle error
        return null;
      }
    });
  }
}
