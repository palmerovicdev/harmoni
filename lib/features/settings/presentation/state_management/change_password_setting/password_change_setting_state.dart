part of 'password_change_setting_cubit.dart';

sealed class ChangePasswordSettingState extends Equatable {
  const ChangePasswordSettingState();
}

final class ChangePasswordSettingInitial extends ChangePasswordSettingState {
  @override
  List<Object> get props => [];
}

final class ChangePasswordSettingInvalid extends ChangePasswordSettingState {
  @override
  List<Object> get props => [];
}

final class ChangePasswordSettingValid extends ChangePasswordSettingState {
  @override
  List<Object> get props => [];
}
