import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';

import '../../model/entity/user.dart';

abstract class MyProfileRepository {
  Future<void> saveUserProfile(UserInfo user);

  Future<UserData?> getUserProfileByName(String name);

  Future<UserData?> getUserProfileByEmail(String email);

  Future<void> deleteUserProfileByNameOrEmail({String? name, String? email});
}

class MyProfileRepositoryImpl implements MyProfileRepository {
  MyProfileRepositoryImpl({required MyProfileApi usersApi}) : _usersApi = usersApi;

  final MyProfileApi _usersApi;

  @override
  Future<void> saveUserProfile(UserInfo user) async {
    await _usersApi.saveUserProfile(user);
  }

  @override
  Future<UserData?> getUserProfileByEmail(String email) async {
    return await _usersApi.getUserProfileByEmail(email);
  }

  @override
  Future<UserData?> getUserProfileByName(String name) async {
    return await _usersApi.getUserProfileByName(name);
  }

  @override
  Future<void> deleteUserProfileByNameOrEmail({String? name, String? email}) async {
      await _usersApi.deleteUserByNameOrEmail(name: name, email: email);
  }
}
