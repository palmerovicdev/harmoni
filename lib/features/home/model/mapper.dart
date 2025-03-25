import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/home/model/model/activity_model.dart';

import 'model/activity_group_model.dart';
import 'model/mood_activity_relation_model.dart';
import 'model/mood_track_model.dart';

extension ActivityMapper on ActivityTableData {
  Activity toModel() {
    return Activity(
      id: id,
      name: name,
      image: image,
      activityGroupId: activityGroupId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ActivityGroupMapper on ActivityGroupTableData {
  ActivityGroup toModel() {
    return ActivityGroup(
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
  ActivityTableCompanion toEntity(int activityGroupId) {
    return ActivityTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      image: Value(image ?? ''),
      activityGroupId: Value(activityGroupId),
    );
  }
}

extension ActivityGroupTableMapper on ActivityGroup {
  ActivityGroupTableCompanion toEntity() {
    return ActivityGroupTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      image: Value(image ?? ''),
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
    );
  }
}

extension MoodActivityRelationTableMapper on MoodActivityRelation {
  MoodActivityRelationTableCompanion toEntity() {
    return MoodActivityRelationTableCompanion(
      id: Value(id ?? 0),
      moodTrackId: Value(moodTrackId ?? 0),
      activityId: Value(activityId ?? 0),
    );
  }
}
