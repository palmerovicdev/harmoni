import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/extensions/string.dart';

import '../../../../../core/service_locator/service_locator.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  bool signUp(String email, String password) {
    emit(SignUpInProgress());
    getMyProfileService().setEmail(email);
    getMyProfileService().setPassword(password);
    emit(SignUpInitial());
    return true;
  }

  void validateEmailStruct(String email) => email.isEmailOnly ? emit(SignUpInvalidEmail()) : emit(SignUpInitial());

  Future<String> validateEmail(String email) async {
    var myProfileService = getMyProfileService();
    return await myProfileService.validateEmail(email);
  }

  String validatePassword(String password) {
    var myProfileService = getMyProfileService();
    var isValidPassword = myProfileService.validatePassword(password);
    return isValidPassword;
  }
}
