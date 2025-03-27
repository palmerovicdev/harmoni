part of 'my_profile_setting_cubit.dart';

sealed class MyProfileSettingState extends Equatable {
  const MyProfileSettingState();
}

final class MyProfileSettingInitial extends MyProfileSettingState {
  @override
  List<Object> get props => [];
}
