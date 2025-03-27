part of 'account_setting_cubit.dart';

sealed class AccountSettingState extends Equatable {
  const AccountSettingState();
}

final class AccountSettingInitial extends AccountSettingState {
  @override
  List<Object> get props => [];
}
