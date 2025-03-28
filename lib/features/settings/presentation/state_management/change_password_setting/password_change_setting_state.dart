part of 'password_change_setting_cubit.dart';

sealed class ChangePasswordSettingState extends Equatable {
  const ChangePasswordSettingState();
}

final class PasswordChangeSettingInitial extends ChangePasswordSettingState {
  @override
  List<Object> get props => [];
}
