import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(InitInitial());
}
