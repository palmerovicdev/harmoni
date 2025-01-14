import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_sign_up_event.dart';
part 'email_sign_up_state.dart';

class EmailSignUpBloc extends Bloc<EmailSignUpEvent, EmailSignUpState> {
  EmailSignUpBloc() : super(EmailSignUpInitial()) {
    on<EmailSignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
