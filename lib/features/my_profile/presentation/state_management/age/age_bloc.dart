import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'age_event.dart';
part 'age_state.dart';

class AgeBloc extends Bloc<AgeEvent, AgeState> {
  AgeBloc() : super(EmailSignUpInitial()) {
    on<AgeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
