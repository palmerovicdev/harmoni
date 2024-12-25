import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/logger.dart';

part 'moodtrack_event.dart';
part 'moodtrack_state.dart';

class MoodtrackBloc extends Bloc<MoodtrackEvent, MoodtrackState> {
  MoodtrackBloc() : super(MoodtrackInitial()) {
    on<MoodtrackEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  void onChange(Change<MoodtrackState> change) {
    logI('current: ${change.currentState} next: ${change.nextState}');
    super.onChange(change);
  }
}
