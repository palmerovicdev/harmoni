import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../model/model/activity_model.dart';

class HomeTrackEmotionState extends Equatable {
  final String note;
  final File? video;
  final bool loading;
  final String? error;
  final bool success;
  final Activity? selectedActivity;

  const HomeTrackEmotionState({
    this.note = '',
    this.video,
    this.loading = false,
    this.error,
    this.success = false,
    this.selectedActivity,
  });

  HomeTrackEmotionState copyWith({
    String? note,
    File? video,
    bool? loading,
    String? error,
    bool? success,
    Activity? selectedActivity,
  }) {
    return HomeTrackEmotionState(
      note: note ?? this.note,
      video: video ?? this.video,
      loading: loading ?? this.loading,
      error: error,
      success: success ?? this.success,
      selectedActivity: selectedActivity ?? this.selectedActivity,
    );
  }

  @override
  List<Object?> get props => [note, video, loading, error, success, selectedActivity];
}
