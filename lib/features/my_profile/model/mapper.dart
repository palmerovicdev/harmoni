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
