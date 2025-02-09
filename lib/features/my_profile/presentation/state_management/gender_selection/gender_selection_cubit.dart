import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/service_locator/service_locator.dart';

part 'gender_selection_state.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit() : super(GenderSelectionInitial());

  void setGender(String gender) {
    getMyProfileService().setGender(gender);
    emit(GenderSelected(gender: gender));
  }

  updateGender(String gender) {
    getMyProfileService().setGender(gender);
    getMyProfileService().saveUserProfile();
    emit(GenderSelected(gender: gender));
  }
}
