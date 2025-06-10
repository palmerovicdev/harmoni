import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileRepository {
  Future<bool?> signUp(User user);

  Future<User?> signIn(User user);

  Future<bool?> deleteAccount();

  Future<User?> updateUser(User user);

  Future<User?> getUserProfile();

  Future<bool?> validateName(String name);

  Future<bool?> validateEmail(String email);

  Future<bool?> saveSettings(Map<String, dynamic> settings);

  Future<Map<String, dynamic>> getSettings();
}

class MyProfileRepositoryImpl implements MyProfileRepository {
  MyProfileRepositoryImpl({required MyProfileApi usersApi}) : _usersApi = usersApi;

  final MyProfileApi _usersApi;

  @override
  Future<bool?> signUp(User user) async {
    return _usersApi.signUp(user);
  }

  @override
  Future<User?> getUserProfile() async {
    return _usersApi.getUserProfile();
  }

  @override
  Future<User?> signIn(User user) async {
    var response = await _usersApi.signIn(user);
    if (!(response ?? false)) return null;
    return getUserProfile();
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

  @override
  Future<bool?> deleteAccount() {
    return _usersApi.deleteAccount();
  }

  @override
  Future<bool?> saveSettings(Map<String, dynamic> settings) {
    return _usersApi.saveSettings(settings);
  }

  @override
  Future<Map<String, dynamic>> getSettings() {
    return _usersApi.getSettings();
  }
}
