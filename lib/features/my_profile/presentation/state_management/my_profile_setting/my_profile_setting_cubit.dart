import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

part 'my_profile_setting_state.dart';

class MyProfileSettingCubit extends Cubit<MyProfileSettingState> {
  MyProfileSettingCubit() : super(MyProfileSettingInitial());

  void signOut() {
    getMyProfileService().userProfile = null;
    getHomeService().currentLocationIndex = 0;
  }
}
