part of 'help_setting_cubit.dart';

sealed class HelpSettingState extends Equatable {
  const HelpSettingState();
}

final class HelpSettingInitial extends HelpSettingState {
  final int selectedCategory;

  const HelpSettingInitial({required this.selectedCategory});

  @override
  List<Object> get props => [selectedCategory];
}
