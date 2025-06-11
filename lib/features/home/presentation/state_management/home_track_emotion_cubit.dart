import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../model/model/activity_model.dart';
import '../../service/home_service.dart';
import 'home_track_emotion_state.dart';

class HomeTrackEmotionCubit extends Cubit<HomeTrackEmotionState> {
  final HomeService homeService;

  HomeTrackEmotionCubit({required this.homeService}) : super(const HomeTrackEmotionState());

  void updateNote(String note) => emit(state.copyWith(note: note));

  void setVideo(File? file) => emit(state.copyWith(video: file));

  void selectActivity(Activity? activity) => emit(state.copyWith(selectedActivity: activity));

  Future<void> save() async {
    emit(state.copyWith(loading: true, error: null, success: false));
    try {
      if (state.video == null) throw Exception('Debes grabar un video');
      if (state.selectedActivity == null) throw Exception('Debes seleccionar una actividad');
      await homeService.trackEmotion(state.selectedActivity!.id!, state.video!.path);
      emit(state.copyWith(loading: false, success: true));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
