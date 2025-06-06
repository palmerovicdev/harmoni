import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/helpers/logger.dart';

import '../../../../../core/service_locator/service_locator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void initSignIn() {
    emit(SignInInProgress());
  }

  void signInError(String reason) {
    emit(SignInFailed(reason: reason));
  }

  Future<bool> signIn(String email, String password) async {
    logI('Start email validation');
    emit(SignInInProgress());
    var myProfileService = getMyProfileService();
    var user = await myProfileService.getUserProfile();
    if (user == null) {
      logI('Email not found');
      emit(SignInFailed(reason: 'email'));
      return false;
    }
    logI('Start password validation');

    if ((user.password ?? '').isEmpty) {
      logI('Password not valid');
      emit(SignInFailed(reason: 'password'));
      return false;
    }

    var isValidPassword = myProfileService.matchPassword(password, user.password ?? '');
    if (!isValidPassword) {
      logI('Password not valid');
      emit(SignInFailed(reason: 'password'));
      return false;
    }
    logI('Password valid');
    myProfileService.init(user);
    emit(SignInSuccess());
    return true;
  }
}
