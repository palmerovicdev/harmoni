part of 'age_bloc.dart';

sealed class AgeState extends Equatable {
  const AgeState();
}

final class EmailSignUpInitial extends AgeState {
  @override
  List<Object> get props => [];
}
