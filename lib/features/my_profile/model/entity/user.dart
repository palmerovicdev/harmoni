import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get gender => text()();
  IntColumn get age => integer()();
  TextColumn get avatar => text()();
}

class UserInfo {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? age;
  String? avatar;

  UserInfo({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.age,
    this.avatar,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
      'avatar': avatar,
    };
  }
}