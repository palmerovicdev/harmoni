import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'help_setting_state.dart';

class HelpSettingCubit extends Cubit<HelpSettingState> {
  HelpSettingCubit() : super(HelpSettingInitial(selectedCategory: 0));

  selectIndex(int index) {
    emit(HelpSettingInitial(selectedCategory: index));
  }
}
