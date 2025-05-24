import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileRepository {
  Future<void> signUp(User user);
  Future<void> signIn(User user);
  Future<User?> getUserProfile();
  Future<bool?> validateName(String name);
  Future<bool?> validateEmail(String email);
  Future<User?> updateUser(User user);
}

class MyProfileRepositoryImpl implements MyProfileRepository {
  MyProfileRepositoryImpl({required MyProfileApi usersApi}) : _usersApi = usersApi;

  final MyProfileApi _usersApi;

  @override
  Future<void> signUp(User user) async {
    await _usersApi.signUp(user);
  }

  @override
  Future<User?> getUserProfile() async {
    return _usersApi.getUserProfile();
  }

  @override
  Future<void> signIn(User user) async {
    return _usersApi.signIn(user);
  }

  @override
  Future<bool?> validateEmail(String email) async {
    return _usersApi.validateEmail(email);
  }

  @override
  Future<bool?> validateName(String name) async {
    return _usersApi.validateName(name);
  }

  @override
  Future<User?> updateUser(User user) async {
    return _usersApi.updateUser(user);
  }

}
