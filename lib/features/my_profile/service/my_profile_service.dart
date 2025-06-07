import 'package:harmoni/core/extensions/string.dart';
import 'package:harmoni/features/my_profile/data/repository/my_profile_repository.dart';

import '../../../core/service_locator/service_locator.dart';
import '../model/model/user_model.dart';

class MyProfileService {
  User? userProfile;
  final MyProfileRepository _myProfileRepository;
  String profileAuxGender = '';

  MyProfileService({required MyProfileRepository myProfileRepository}) : _myProfileRepository = myProfileRepository;

  init(User? user) async {
    if (user == null) return;
    userProfile = user;
  }

  Future<void> updateUser() async {
    userProfile?.gender = profileAuxGender.isNotEmpty ? profileAuxGender : userProfile?.gender;
    if (userProfile == null) return;
    var user = await _myProfileRepository.updateUser(userProfile!);
    if (user == null) return;
    init(user);
  }

  Future<User?> signIn() async {
    if (userProfile == null) return null;
    return await _myProfileRepository.signIn(userProfile!);
  }

  Future<bool> signUp({bool shouldUpdate = false}) async {
    userProfile?.gender = profileAuxGender.isNotEmpty ? profileAuxGender : userProfile?.gender;
    if (userProfile == null) return false;
    var response = await _myProfileRepository.signUp(userProfile!);
    if (!(response ?? false)) return false;
    var user = await getUserProfile();
    if (user == null) return false;
    init(user);
    return true;
  }

  Future<User?> getUserProfile() async {
    return await _myProfileRepository.getUserProfile();
  }

  bool validateNameStruct(String name) {
    return name.isLettersOnlyAndFistCharacterUpperCase;
  }

  Future<String> validateName(String name) async {
    var isNameValid = name.isLettersOnlyAndFistCharacterUpperCase;
    if (!isNameValid) return NameValidationResult.invalid.name;
    var userProfile = await _myProfileRepository.validateName(name);
    return userProfile ?? false ? NameValidationResult.success.name : NameValidationResult.repeated.name;
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
    userProfile!.password = password;
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
    var isValid = await _myProfileRepository.validateEmail(email);
    return isValid ?? false ? EmailValidationResult.repeated.name : EmailValidationResult.success.name;
  }

  String validatePassword(String password) {
    var isGreaterThan6Chars = password.length >= 6;
    var isLessThan16Chars = password.length <= 16;
    if (!isGreaterThan6Chars) return PasswordValidationResult.tooShort.name;
    if (!isLessThan16Chars) return PasswordValidationResult.tooLong.name;
    return PasswordValidationResult.success.name;
  }

  void signOut() {
    userProfile = null;
    getConnectionService().token = '';
    getHomeService().currentLocationIndex = 0;
  }

  Future<void> deleteAccount() async {
    await _myProfileRepository.deleteAccount();
  }
}

enum EmailValidationResult { invalid, repeated, success }

enum PasswordValidationResult { invalid, tooShort, tooLong, success }

enum NameValidationResult { invalid, repeated, success }
