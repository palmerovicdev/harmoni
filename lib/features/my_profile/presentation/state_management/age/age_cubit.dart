import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial());

  void setAge(int age) {
    getMyProfileService().setAge(age);
    emit(AgeSelected(age: age));
  }
}
