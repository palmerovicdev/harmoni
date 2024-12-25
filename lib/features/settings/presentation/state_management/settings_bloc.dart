import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/logger.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  void onChange(Change<SettingsState> change) {
    logI('current: ${change.currentState} next: ${change.nextState}');
    super.onChange(change);
  }
}
