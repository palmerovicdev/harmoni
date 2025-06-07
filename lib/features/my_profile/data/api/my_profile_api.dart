import 'package:dio/dio.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileApi {
  Future<bool?> signUp(User user);

  Future<bool?> signIn(User user);

  Future<User?> getUserProfile();

  Future<bool?> validateName(String name);

  Future<bool?> validateEmail(String email);

  Future<User?> updateUser(User user);

  Future<bool?> deleteAccount();
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
        return null;
      }
    });
  }

  @override
  Future<bool?> signUp(User user) async {
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
      getConnectionService().token = response.data['token'] ?? '';
      return getConnectionService().token.isNotEmpty;
    } else {
      return false;
    }
  }

  @override
  Future<bool?> signIn(User user) {
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
        connection.token = response.data['token'] ?? '';
        return connection.token.isNotEmpty;
      } else {
        // handle error
        return false;
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

  @override
  Future<User?> updateUser(User user) async {
    var connection = getConnectionService();
    var response = await connection.post(
      '$_userBaseUrl/update',
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
      //TODO 6/7/25 palmerodev : add return for user
    } else {
      // handle error
    }
  }

  @override
  Future<bool?> deleteAccount() {
    var connection = getConnectionService();
    return connection
        .post(
      '$_myProfileBaseUrl/delete',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        // handle error
        return false;
      }
    });
  }
}
