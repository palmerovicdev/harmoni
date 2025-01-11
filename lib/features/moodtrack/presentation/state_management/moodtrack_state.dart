part of 'moodtrack_bloc.dart';

sealed class MoodtrackState extends Equatable {
  const MoodtrackState();
}

final class MoodtrackInitial extends MoodtrackState {
  @override
  List<Object> get props => [];
}
