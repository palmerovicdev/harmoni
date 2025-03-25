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
      createAt: createAt,
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
