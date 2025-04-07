import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/model/mapper.dart';

import '../../model/model/user_model.dart';

abstract class MyProfileApi {
  Future<void> saveUserProfile(User user);

  Future<UserTableData?> getUserProfileByName(String name);

  Future<UserTableData?> getUserProfileByEmail(String email);

  Future<void> deleteUserByNameOrEmail({String? name, String? email});

  Future<void> updateUserProfile(User user);
}

class MyProfileApiDBImpl implements MyProfileApi {
  MyProfileApiDBImpl({required Database connection}) : _connection = connection;

  final Database _connection;

  @override
  Future<void> saveUserProfile(User user) async {
    await _connection.userTable.insert().insert(user.toEntity());
  }

  @override
  Future<void> updateUserProfile(User user) async {
    await _connection.userTable.update().replace(user.toEntity());
  }

  @override
  Future<void> deleteUserByNameOrEmail({String? name, String? email}) async {
    if (name != null) {
      _connection.userTable.deleteWhere((tbl) => tbl.name.equals(name));
    }
    if (email != null) {
      _connection.userTable.deleteWhere((tbl) => tbl.email.equals(email));
    }
  }

  @override
  Future<UserTableData?> getUserProfileByEmail(String email) async {
    return (_connection.select(_connection.userTable)..where((u) => u.email.equals(email))).get().then((value) => value.firstOrNull);
  }

  @override
  Future<UserTableData?> getUserProfileByName(String name) async {
    return (_connection.select(_connection.userTable)..where((u) => u.name.equals(name))).get().then((value) => value.firstOrNull);
  }
}
