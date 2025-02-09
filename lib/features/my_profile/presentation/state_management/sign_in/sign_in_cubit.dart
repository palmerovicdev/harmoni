import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/service_locator/service_locator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  signIn(String email, String password) async {
    emit(SignInInProgress());
    var myProfileService = getMyProfileService();
    var user = await myProfileService.getUserProfileByEmail(email);
    if (user != null) {
      emit(SignInFailed(reason: 'email'));
      return;
    }
    var isValidPassword = myProfileService.matchPassword(password, user?.password ?? '');
    if (!isValidPassword) {
      emit(SignInFailed(reason: 'password'));
      return;
    }
    myProfileService.init(user);
    emit(SignInSuccess());

  }
}
