import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/features/home/model/mapper.dart';

import '../../model/model/activity_group_model.dart';
import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';

abstract class HomeApi {
  Future<List<ActivityTableData>> getActivitiesByMoodIds(List<int> moodIds);

  Future<List<MoodTrackTableData>> getMoodsByUserId(int userId);

  Future<List<MoodTrackTableData>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate});

  Future<List<ActivityGroupTableData>> getActivityGroups();

  Future<List<ActivityTableData>> getActivitiesByGroupsIds(List<int> groupIds);

  Future<void> saveActivity(int activityGroupId, Activity activity);

  Future<void> saveActivityGroup(ActivityGroup activityGroup);

  Future<void> saveMoodActivityRelation(MoodActivityRelation moodActivityRelation);
}

class HomeApiImpl implements HomeApi {
  final Database _connection;

  HomeApiImpl({required Database connection}) : _connection = connection;

  @override
  Future<List<ActivityTableData>> getActivitiesByMoodIds(List<int> moodIds) {
    final query = _connection.select(_connection.activityTable).join([
      innerJoin(
        _connection.moodActivityRelationTable,
        _connection.moodActivityRelationTable.activityId.equalsExp(_connection.activityTable.id),
      ),
    ])
      ..where(_connection.moodActivityRelationTable.moodTrackId.isIn(moodIds));

    return query.map((row) => row.readTable(_connection.activityTable)).get();
  }

  @override
  Future<List<MoodTrackTableData>> getMoodsByUserId(int userId) async {
    return (_connection.select(_connection.moodTrackTable)..where((tbl) => tbl.userId.equals(userId))).get();
  }

  @override
  Future<List<MoodTrackTableData>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate}) async {
    return (_connection.select(_connection.moodTrackTable)
          ..where((tbl) => tbl.userId.equals(userId))
          ..where((tbl) => endDate == null ? tbl.createdAt.isBiggerThanValue(startDate) : tbl.createdAt.isBetweenValues(startDate, endDate)))
        .get();
  }

  @override
  Future<List<ActivityGroupTableData>> getActivityGroups() async {
    return (_connection.select(_connection.activityGroupTable)).get();
  }

  @override
  Future<List<ActivityTableData>> getActivitiesByGroupsIds(List<int> groupIds) async {
    return (_connection.select(_connection.activityTable)..where((tbl) => tbl.id.isIn(groupIds))).get();
  }

  @override
  Future<void> saveActivity(int activityGroupId, Activity activity) {
    return _connection.activityTable.insertOnConflictUpdate(activity.toEntity(activityGroupId));
  }

  @override
  Future<void> saveActivityGroup(ActivityGroup activityGroup) {
    return _connection.activityGroupTable.insertOnConflictUpdate(activityGroup.toEntity());
  }

  @override
  Future<void> saveMoodActivityRelation(MoodActivityRelation moodActivityRelation) {
    return _connection.moodActivityRelationTable.insertOnConflictUpdate(moodActivityRelation.toEntity());
  }
}
