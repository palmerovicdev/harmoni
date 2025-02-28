part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();
}

final class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInInProgress extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInSuccess extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInFailed extends SignInState {
  final String reason;

  const SignInFailed({required this.reason});

  @override
  List<Object> get props => [reason];
}
