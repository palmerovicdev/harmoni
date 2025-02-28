import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';

import '../../model/entity/user.dart';

abstract class MyProfileApi {
  Future<void> saveUserProfile(UserInfo user);

  Future<UserData?> getUserProfileByName(String name);

  Future<UserData?> getUserProfileByEmail(String email);

  Future<void> deleteUserByNameOrEmail({String? name, String? email});
}

class MyProfileApiDBImpl implements MyProfileApi {
  MyProfileApiDBImpl({required Database connection}) : _connection = connection;

  final Database _connection;

  @override
  Future<void> saveUserProfile(UserInfo user) async {
    await _connection.user.insertOnConflictUpdate(UserCompanion.insert(
      name: user.name ?? '',
      email: user.email ?? '',
      password: user.password ?? '',
      gender: user.gender ?? '',
      age: user.age ?? 0,
      avatar: user.avatar ?? '',
    ));
  }

  @override
  Future<void> deleteUserByNameOrEmail({String? name, String? email}) async {
    if (name != null) {
      _connection.user.deleteWhere((tbl) => tbl.name.equals(name));
    }
    if (email != null) {
      _connection.user.deleteWhere((tbl) => tbl.email.equals(email));
    }
  }

  @override
  Future<UserData?> getUserProfileByEmail(String email) async {
    return (_connection.select(_connection.user)..where((u) => u.email.equals(email))).get().then((value) => value.firstOrNull);
  }

  @override
  Future<UserData?> getUserProfileByName(String name) async {
    return (_connection.select(_connection.user)..where((u) => u.name.equals(name))).get().then((value) => value.firstOrNull);
  }
}
