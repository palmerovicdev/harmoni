import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(EmailSignUpInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
