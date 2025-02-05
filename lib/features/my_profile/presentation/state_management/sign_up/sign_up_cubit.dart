import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/service_locator/service_locator.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp(String email, String password) async {
    emit(SignUpInProgress());
    var myProfileService = getMyProfileService();
    var isValidEmail = await myProfileService.validateEmail(email);
    if (isValidEmail == 'success') {
      getMyProfileService().setEmail(email);
      getMyProfileService().setPassword(password);
      emit(SignUpSuccess());
      return;
    }
    if (isValidEmail == 'repeated') emit(SignUpFailure(isInvalidEmail: false));
    if (isValidEmail == 'invalid') emit(SignUpFailure(isInvalidEmail: true));
  }
}
