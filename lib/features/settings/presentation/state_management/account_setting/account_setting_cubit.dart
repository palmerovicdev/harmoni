import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_setting_state.dart';

class AccountSettingCubit extends Cubit<AccountSettingState> {
  AccountSettingCubit() : super(AccountSettingInitial());

  changeValue() {
    emit(AccountSettingInitial(hasChangedData: true));
  }

  resetState() {
    emit(AccountSettingInitial(hasChangedData: false, hasBeenPop: false));
  }

  changePopState() {
    emit(AccountSettingInitial(hasBeenPop: true));
  }

  revertChangedData() {
    emit(AccountSettingInitial(hasChangedData: false));
  }
}
