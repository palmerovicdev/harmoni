import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_setting_state.dart';

class AccountSettingCubit extends Cubit<AccountSettingState> {
  AccountSettingCubit() : super(AccountSettingInitial());
}
