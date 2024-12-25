import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:harmoni/core/helpers/logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  void onChange(Change<HomeState> change) {
    logI('current: ${change.currentState} next: ${change.nextState}');
    super.onChange(change);
  }
}
