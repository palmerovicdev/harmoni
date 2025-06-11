import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/home/model/model/activity_model.dart';

import 'model/mood_activity_relation_model.dart';
import 'model/mood_track_model.dart';

extension ActivityMapper on ActivityTableData {
  Activity toModel() {
    return Activity(
      id: id,
      name: name,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension MoodTrackMapper on MoodTrackTableData {
  MoodTrack toModel() {
    return MoodTrack(
      id: id,
      userId: userId,
      imageMood: imageMood,
      recordMood: recordMood,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension MoodActivityRelationMapper on MoodActivityRelationTableData {
  MoodActivityRelation toModel() {
    return MoodActivityRelation(
      id: id,
      moodTrackId: moodTrackId,
      activityId: activityId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ActivityTableMapper on Activity {
  ActivityTableCompanion toEntity() {
    return ActivityTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      image: Value(image ?? ''),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
    );
  }
}

extension MoodTrackTableMapper on MoodTrack {
  MoodTrackTableCompanion toEntity() {
    return MoodTrackTableCompanion(
      id: Value(id ?? 0),
      userId: Value(userId ?? 0),
      imageMood: Value(imageMood ?? ''),
      recordMood: Value(recordMood ?? ''),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
    );
  }
}

extension MoodActivityRelationTableMapper on MoodActivityRelation {
  MoodActivityRelationTableCompanion toEntity() {
    return MoodActivityRelationTableCompanion(
      id: Value(id ?? 0),
      moodTrackId: Value(moodTrackId ?? 0),
      activityId: Value(activityId ?? 0),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(updatedAt ?? DateTime.now()),
    );
  }
}
