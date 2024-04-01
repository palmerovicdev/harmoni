import 'package:harmoni/features/my_profile/data/api/my_profile_api.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileRepository {
  Future<void> saveUserProfile(User user);

}

class MyProfileRepositoryImpl implements MyProfileRepository {
  MyProfileRepositoryImpl({required MyProfileApi usersApi}) : _usersApi = usersApi;

  final MyProfileApi _usersApi;

  @override
  Future<void> saveUserProfile(User user) async {
    await _usersApi.signUp(user);
  }

}
