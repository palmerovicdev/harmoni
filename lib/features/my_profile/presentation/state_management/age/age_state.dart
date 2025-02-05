part of 'age_cubit.dart';

sealed class AgeState extends Equatable {
  const AgeState();
}

final class AgeInitial extends AgeState {
  @override
  List<Object> get props => [];
}
