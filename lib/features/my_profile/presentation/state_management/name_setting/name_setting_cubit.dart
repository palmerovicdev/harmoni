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

  Future<bool> setName(String name) async {
    var myProfileService = getMyProfileService();
    await myProfileService.setName(name);
    emit(NameSettingValid(name: name));
    return true;
  }

  Future<bool> updateName(String text) async {
    var myProfileService = getMyProfileService();
    await myProfileService.setName(text);
    emit(NameSettingValid(name: text));
    return true;
  }
}
