part of 'email_sign_up_bloc.dart';

sealed class EmailSignUpState extends Equatable {
  const EmailSignUpState();
}

final class EmailSignUpInitial extends EmailSignUpState {
  @override
  List<Object> get props => [];
}
