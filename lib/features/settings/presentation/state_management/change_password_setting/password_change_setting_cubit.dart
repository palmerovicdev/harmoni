import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_change_setting_state.dart';

class ChangePasswordSettingCubit extends Cubit<ChangePasswordSettingState> {
  ChangePasswordSettingCubit() : super(PasswordChangeSettingInitial());
}
