import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'security_setting_state.dart';

class SecuritySettingCubit extends Cubit<SecuritySettingState> {
  SecuritySettingCubit() : super(SecuritySettingInitial());
}
