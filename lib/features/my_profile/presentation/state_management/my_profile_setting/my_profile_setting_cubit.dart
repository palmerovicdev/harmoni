import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_profile_setting_state.dart';

class MyProfileSettingCubit extends Cubit<MyProfileSettingState> {
  MyProfileSettingCubit() : super(MyProfileSettingInitial());
}
