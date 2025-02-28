import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

part 'name_setting_state.dart';

class NameSettingCubit extends Cubit<NameSettingState> {
  NameSettingCubit() : super(NameSettingInitial());

  Future<String> validateName(String name) async {
    var myProfileService = getMyProfileService();
    return await myProfileService.validateName(name);
  }

  setName(String name) async {
    var myProfileService = getMyProfileService();
    myProfileService.setName(name);
    emit(NameSettingValid(name: name));
  }

  updateName(String text) async {
    var myProfileService = getMyProfileService();
    myProfileService.setName(text);
    myProfileService.saveUserProfile();
    emit(NameSettingValid(name: text));
  }
}
