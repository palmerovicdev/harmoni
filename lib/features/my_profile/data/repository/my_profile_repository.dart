import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';

import '../../model/entity/user.dart';
import '../../model/model/user_model.dart';

abstract class MyProfileRepository {
  Future<void> saveUserProfile(User user);

  Future<UserTableData?> getUserProfileByName(String name);

  Future<UserTableData?> getUserProfileByEmail(String email);

  Future<void> deleteUserProfileByNameOrEmail({String? name, String? email});
}

class MyProfileRepositoryImpl implements MyProfileRepository {
  MyProfileRepositoryImpl({required MyProfileApi usersApi}) : _usersApi = usersApi;

  final MyProfileApi _usersApi;

  @override
  Future<void> saveUserProfile(User user) async {
    await _usersApi.saveUserProfile(user);
  }

  @override
  Future<UserTableData?> getUserProfileByEmail(String email) async {
    return await _usersApi.getUserProfileByEmail(email);
  }

  @override
  Future<UserTableData?> getUserProfileByName(String name) async {
    return await _usersApi.getUserProfileByName(name);
  }

  @override
  Future<void> deleteUserProfileByNameOrEmail({String? name, String? email}) async {
    await _usersApi.deleteUserByNameOrEmail(name: name, email: email);
  }
}
