part of 'name_setting_cubit.dart';

sealed class NameSettingState extends Equatable {
  const NameSettingState();
}

final class NameSettingInitial extends NameSettingState {
  @override
  List<Object> get props => [];
}

final class NameSettingValid extends NameSettingState with EquatableMixin {
  final String? name;
  const NameSettingValid({this.name});
  @override
  List<Object?> get props => [name];
}