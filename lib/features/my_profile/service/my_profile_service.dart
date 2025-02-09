import 'package:crypt/crypt.dart';
import 'package:drift/drift.dart';
import 'package:harmoni/core/extensions/string.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';

import '../model/entity/user.dart';

class MyProfileService {
  UserInfo? userProfile;
  final MyProfileRepository _myProfileRepository;

  MyProfileService({required MyProfileRepository myProfileRepository}) : _myProfileRepository = myProfileRepository;

  init(UserData? user) async {
    if (user == null) return;
    userProfile = UserInfo.fromJson(user.toJson());
  }

  Future<void> initializeUserFromDb(Database db, String name) async {
    if (await db.user.count().getSingle() == 0) return;

    var singleUser = await (db.select(db.user)
          ..where(
            (tbl) => tbl.name.equals(name),
          ))
        .getSingle();

    userProfile = UserInfo.fromJson(singleUser.toJson());
  }

  Future<bool> saveUserProfile() async {
    if (userProfile == null) return false;
    await _myProfileRepository.saveUserProfile(userProfile!);
    var user = await getUserProfileByName(userProfile!.name!);
    if (user == null) return false;
    init(user);
    return true;
  }

  Future<UserData?> getUserProfileByName(String name) async {
    return await _myProfileRepository.getUserProfileByName(name);
  }

  bool validateNameStruct(String name) {
    return name.isLettersOnlyAndFistCharacterUpperCase;
  }

  Future<String> validateName(String name) async {
    var isNameValid = name.isLettersOnlyAndFistCharacterUpperCase;
    if (!isNameValid) return NameValidationResult.invalid.name;
    var userProfile = await getUserProfileByName(name);
    return userProfile == null ? NameValidationResult.success.name : NameValidationResult.repeated.name;
  }

  setName(String name) {
    if (userProfile == null) return;
    userProfile!.name = name;
  }

  setEmail(String email) {
    if (userProfile == null) return;
    userProfile!.email = email;
  }

  setPassword(String password) {
    if (userProfile == null) return;
    userProfile!.password = hashPassword(password);
  }

  setGender(String gender) {
    if (userProfile == null) return;
    userProfile!.gender = gender;
  }

  setAge(int age) {
    if (userProfile == null) return;
    userProfile!.age = age;
  }

  setAvatar(String avatar) {
    if (userProfile == null) return;
    userProfile!.avatar = avatar;
  }

  Future<String> validateEmail(String email) async {
    var result = email.isEmailOnly;
    if (!result) return EmailValidationResult.invalid.name;
    var userProfile = await getUserProfileByEmail(email);
    return userProfile != null ? EmailValidationResult.repeated.name : EmailValidationResult.success.name;
  }

  String hashPassword(String password) => Crypt.sha256(password, rounds: 10000, salt: "miSaltSeguro").toString();

  String validatePassword(String password) {
    var isGreaterThan6Chars = password.length >= 6;
    var isLessThan16Chars = password.length <= 16;
    if (!isGreaterThan6Chars) return PasswordValidationResult.tooShort.name;
    if (!isLessThan16Chars) return PasswordValidationResult.tooLong.name;
    return PasswordValidationResult.success.name;
  }

  bool matchPassword(String password, String hashedPassword) => Crypt(hashedPassword) == Crypt(hashPassword(password));

  Future<UserData?> getUserProfileByEmail(String email) async {
    return await _myProfileRepository.getUserProfileByEmail(email);
  }
}

enum EmailValidationResult { invalid, repeated, success }

enum PasswordValidationResult { invalid, tooShort, tooLong, success }

enum NameValidationResult { invalid, repeated, success }
