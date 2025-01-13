import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/logger.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitial()) {
    on<InitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  void onChange(Change<InitState> change) {
    logI('current: ${change.currentState} next: ${change.nextState}');
    super.onChange(change);
  }
}
