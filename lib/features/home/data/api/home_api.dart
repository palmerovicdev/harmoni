import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/home/model/entity/activity.dart';
import 'package:harmoni/features/home/model/entity/activity_group.dart';
import 'package:harmoni/features/home/model/entity/mood_activity_relation.dart';
import 'package:harmoni/features/home/model/entity/mood_track.dart';

import '../../model/model/activity_group_model.dart';
import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';

abstract class HomeApi {
  Future<List<ActivityTable>> getActivitiesByMoodIds(List<int> moodIds);

  Future<List<MoodTrackTable>> getMoodsByUserId(int userId);

  Future<List<MoodTrackTable>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate});

  Future<List<ActivityGroupTable>> getActivityGroups();

  Future<List<ActivityTable>> getActivitiesByGroupsIds(List<int> groupIds);

  Future<bool> saveActivity(int activityGroupId, Activity activity);

  Future<bool> saveActivityGroup(ActivityGroup activityGroup);

  Future<bool> saveMoodActivityRelation(MoodActivityRelation moodActivityRelation);
}

class HomeApiImpl implements HomeApi {
  final Database _connection;

  HomeApiImpl({required Database connection}) : _connection = connection;

  @override
  Future<List<ActivityTable>> getActivitiesByMoodIds(List<int> moodIds) async {
    var activityIds = (await (_connection.select(_connection.moodActivityRelationTable)
      ..where((tbl) => tbl.moodTrackId.isIn(moodIds))
      ).get()).map((e) => e.activityId).toList();
    var activities = await (_connection.select(_connection.activityTable)..where((tbl) => tbl.id.isIn(activityIds))).get();
    throw UnimplementedError();
  }

  @override
  Future<List<MoodTrackTable>> getMoodsByUserId(int userId) async {
    // TODO: implement getMoodsByUserId
    throw UnimplementedError();
  }

  @override
  Future<List<MoodTrackTable>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate}) async {
    // TODO: implement getMoodsByUserIdAndCreatedAt
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityGroupTable>> getActivityGroups() async {
    // TODO: implement getActivityGroups
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityTable>> getActivitiesByGroupsIds(List<int> groupIds) async {
    // TODO: implement getActivitiesByGroupsIds
    throw UnimplementedError();
  }

  @override
  Future<bool> saveActivity(int activityGroupId, Activity activity) {
    // TODO: implement saveActivity
    throw UnimplementedError();
  }

  @override
  Future<bool> saveActivityGroup(ActivityGroup activityGroup) {
    // TODO: implement saveActivityGroup
    throw UnimplementedError();
  }

  @override
  Future<bool> saveMoodActivityRelation(MoodActivityRelation moodActivityRelation) {
    // TODO: implement saveMoodActivityRelation
    throw UnimplementedError();
  }
}
