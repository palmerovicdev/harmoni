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

final class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpFailure extends SignUpState {
  final bool isInvalidEmail;

  const SignUpFailure({required this.isInvalidEmail});
  @override
  List<Object> get props => [isInvalidEmail];
}