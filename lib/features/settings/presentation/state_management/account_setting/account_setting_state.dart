part of 'account_setting_cubit.dart';

sealed class AccountSettingState extends Equatable {
  const AccountSettingState();

}

final class AccountSettingInitial extends AccountSettingState {
  final bool hasChangedData;

  const AccountSettingInitial({this.hasChangedData = false});

  @override
  List<Object> get props => [hasChangedData];
}
