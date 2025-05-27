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
    var user = await getMyProfileService().signIn();
    if (user == null) {
      signInError("Password not valid");
      return false;
    }
    logI('Password valid');
    getMyProfileService().init(user);
    emit(SignInSuccess());
    return true;
  }
}
