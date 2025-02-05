import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial());
}
