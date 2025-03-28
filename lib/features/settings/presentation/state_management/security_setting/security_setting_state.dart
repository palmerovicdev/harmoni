part of 'security_setting_cubit.dart';

sealed class SecuritySettingState extends Equatable {
  const SecuritySettingState();
}

final class SecuritySettingInitial extends SecuritySettingState {
  @override
  List<Object> get props => [];
}
