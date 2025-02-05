import 'package:crypt/crypt.dart';
import 'package:drift/drift.dart';
import 'package:harmoni/core/extensions/string.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';

import '../model/entity/user.dart';

class MyProfileService {
  UserInfo? userProfile;
  final MyProfileRepository _myProfileRepository;

  MyProfileService({required MyProfileRepository myProfileRepository}) : _myProfileRepository = myProfileRepository;

  init(String name) async {
    var db = getDatabaseService();
    await initializeUserFromDb(db, name);
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
    return true;
  }

  Future<UserData?> getUserProfileByName(String name) async {
    return await _myProfileRepository.getUserProfileByName(name);
  }

  Future<bool> validateName(String name) async {
    var isNameValid = name.isLettersOnlyAndFistCharacterUpperCase;
    if (!isNameValid) return false;
    var userProfile = await getUserProfileByName(name);
    return userProfile == null;
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

  bool validateEmail(String email) => email.isEmailOnly;

  String hashPassword(String password) => Crypt.sha256(password, rounds: 10000, salt: "miSaltSeguro").toString();

  bool validatePassword(String password, String hashedPassword) => Crypt(hashedPassword) == password;
}
