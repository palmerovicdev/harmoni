import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/model/model/user_model.dart';

extension UserMapper on UserTableData {
  User toModel() {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      gender: gender,
      age: age,
      avatar: avatar,
    );
  }
}

extension UserTableMapper on User {
  UserTableCompanion toEntity() {
    return UserTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      email: Value(email ?? ''),
      password: Value(password ?? ''),
      gender: Value(gender ?? ''),
      age: Value(age ?? 0),
      avatar: Value(avatar ?? ''),
    );
  }
}
