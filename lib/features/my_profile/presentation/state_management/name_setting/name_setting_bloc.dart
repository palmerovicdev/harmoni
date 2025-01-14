import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_setting_event.dart';
part 'name_setting_state.dart';

class NameSettingBloc extends Bloc<NameSettingEvent, NameSettingState> {
  NameSettingBloc() : super(NameSettingInitial()) {
    on<NameSettingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
