part of 'init_cubit.dart';

sealed class InitState extends Equatable {
  const InitState();
}

final class InitInitial extends InitState {
  @override
  List<Object> get props => [];
}
