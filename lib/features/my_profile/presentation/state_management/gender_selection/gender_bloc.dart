import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(EmailSignUpInitial()) {
    on<GenderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
