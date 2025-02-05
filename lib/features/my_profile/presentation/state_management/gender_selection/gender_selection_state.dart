part of 'gender_selection_cubit.dart';

sealed class GenderSelectionState extends Equatable {
  const GenderSelectionState();
}

final class GenderSelectionInitial extends GenderSelectionState {
  @override
  List<Object> get props => [];
}

final class GenderSelected extends GenderSelectionState {
  final String gender;

  const GenderSelected({required this.gender});

  @override
  List<Object> get props => [gender];
}