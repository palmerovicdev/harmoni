import 'package:crypt/crypt.dart';
import 'package:drift/drift.dart';
import 'package:harmoni/core/extensions/string.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';
import 'package:harmoni/features/my_profile/model/mapper.dart';

import '../model/model/user_model.dart';

class MyProfileService {
  User? userProfile;
  final MyProfileRepository _myProfileRepository;

  MyProfileService({required MyProfileRepository myProfileRepository}) : _myProfileRepository = myProfileRepository;

  init(User? user) async {
    if (user == null) return;
    userProfile = user;
  }

  Future<void> initializeUserFromDb(Database db, String name) async {
    if (await db.userTable.count().getSingle() == 0) return;

    var singleUser = await (db.select(db.userTable)
          ..where(
            (tbl) => tbl.name.equals(name),
          ))
        .getSingle();

    userProfile = singleUser.toModel();
  }

  Future<bool> saveUserProfile() async {
    if (userProfile == null) return false;
    await _myProfileRepository.saveUserProfile(userProfile!);
    var user = await getUserProfileByName(userProfile!.name!);
    if (user == null) return false;
    init(user);
    return true;
  }

  Future<User?> getUserProfileByName(String name) async {
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
    userProfile ??= User();
    userProfile!.name = name;
  }

  setEmail(String email) {
    userProfile ??= User();
    userProfile!.email = email;
  }

  setPassword(String password) {
    userProfile ??= User();
    userProfile!.password = hashPassword(password);
  }

  setGender(String gender) {
    userProfile ??= User();
    userProfile!.gender = gender;
  }

  setAge(int age) {
    userProfile ??= User();
    userProfile!.age = age;
  }

  setAvatar(String avatar) {
    userProfile ??= User();
    userProfile!.avatar = avatar;
  }

  Future<String> validateEmail(String email) async {
    var result = email.isEmailOnly;
    if (!result) return EmailValidationResult.invalid.name;
    var userProfile = await getUserProfileByEmail(email);
    return userProfile != null ? EmailValidationResult.repeated.name : EmailValidationResult.success.name;
  }

  String hashPassword(String password) => Crypt.sha256(password, rounds: 1000, salt: "miSaltSeguro").hash;

  String validatePassword(String password) {
    var isGreaterThan6Chars = password.length >= 6;
    var isLessThan16Chars = password.length <= 16;
    if (!isGreaterThan6Chars) return PasswordValidationResult.tooShort.name;
    if (!isLessThan16Chars) return PasswordValidationResult.tooLong.name;
    return PasswordValidationResult.success.name;
  }

  bool matchPassword(String password, String hashedPassword) {
    var isValid = hashedPassword == hashPassword(password);
    return isValid;
  }

  Future<User?> getUserProfileByEmail(String email) async {
    return await _myProfileRepository.getUserProfileByEmail(email);
  }

  void deleteUserProfileByNameOrEmail({String? name, String? email}) {
    _myProfileRepository.deleteUserProfileByNameOrEmail(name: name ?? userProfile?.name, email: email ?? userProfile?.email);
  }
}

enum EmailValidationResult { invalid, repeated, success }

enum PasswordValidationResult { invalid, tooShort, tooLong, success }

enum NameValidationResult { invalid, repeated, success }
