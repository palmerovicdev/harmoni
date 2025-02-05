import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gender_selection_state.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit() : super(GenderSelectionInitial());
}
