import 'package:harmoni/features/home/data/api/home_api.dart';

import '../../model/model/activity_group_model.dart';
import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';
import '../../model/model/mood_track_model.dart';

abstract class HomeRepository {
  Future<List<Activity>> getActivitiesByMoodIds(List<int> moodIds);

  Future<List<MoodTrack>> getMoodsByUserId(int userId);

  Future<List<MoodTrack>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate});

  Future<List<ActivityGroup>> getActivityGroups();

  Future<List<Activity>> getActivitiesByGroupsIds(List<int> groupIds);

  Future<bool> saveActivity(int activityGroupId, Activity activity);

  Future<bool> saveActivityGroup(ActivityGroup activityGroup);

  Future<bool> saveMoodActivityRelation(MoodActivityRelation moodActivityRelation);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi _homeApi;

  HomeRepositoryImpl({required HomeApi homeApi}) : _homeApi = homeApi;

  @override
  Future<List<Activity>> getActivitiesByGroupsIds(List<int> groupIds) {
    // TODO: implement getActivitiesByGroupsIds
    throw UnimplementedError();
  }

  @override
  Future<List<Activity>> getActivitiesByMoodIds(List<int> moodIds) {
    // TODO: implement getActivitiesByMoodIds
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityGroup>> getActivityGroups() {
    // TODO: implement getActivityGroups
    throw UnimplementedError();
  }

  @override
  Future<List<MoodTrack>> getMoodsByUserId(int userId) {
    // TODO: implement getMoodsByUserId
    throw UnimplementedError();
  }

  @override
  Future<List<MoodTrack>> getMoodsByUserIdAndCreatedAt(int userId, DateTime startDate, {DateTime? endDate}) {
    // TODO: implement getMoodsByUserIdAndCreatedAt
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
