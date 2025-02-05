import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

part 'name_setting_state.dart';

class NameSettingCubit extends Cubit<NameSettingState> {
  NameSettingCubit() : super(NameSettingInitial());

  setName(String name) async {
    var myProfileService = getMyProfileService();
    if (await myProfileService.validateName(name)) {
      myProfileService.setName(name);
      emit(NameSettingValid(name: name));
    }
  }
}
