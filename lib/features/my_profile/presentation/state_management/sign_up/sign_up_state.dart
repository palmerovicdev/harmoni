part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();
}

final class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpInProgress extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpInvalidEmail extends SignUpState {
  @override
  List<Object> get props => [];
}