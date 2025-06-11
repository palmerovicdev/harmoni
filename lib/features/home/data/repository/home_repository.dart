import 'package:harmoni/features/home/data/api/home_api.dart';

import '../../model/model/activity_model.dart';
import '../../model/model/mood_track_model.dart';

abstract class HomeRepository {
  Future<List<Activity>> getActivities();

  Future<void> createActivities(List<Activity> activities);

  Future<void> deleteActivity(int id);

  Future<void> trackEmotion(int activityId, String videoPath);

  Future<List<MoodTrack>> getEmotionsByActivity(int activityId);

  Future<List<MoodTrack>> getEmotions();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi _homeApi;

  HomeRepositoryImpl({required HomeApi homeApi}) : _homeApi = homeApi;

  @override
  Future<List<Activity>> getActivities() async {
    return _homeApi.getActivities();
  }

  @override
  Future<void> createActivities(List<Activity> activities) async {
    return _homeApi.createActivities(activities);
  }

  @override
  Future<void> deleteActivity(int id) async {
    return _homeApi.deleteActivity(id);
  }

  @override
  Future<void> trackEmotion(int activityId, String videoPath) async {
    return _homeApi.trackEmotion(activityId, videoPath);
  }

  @override
  Future<List<MoodTrack>> getEmotionsByActivity(int activityId) async {
    return _homeApi.getEmotionsByActivity(activityId);
  }

  @override
  Future<List<MoodTrack>> getEmotions() async {
    return _homeApi.getEmotions();
  }
}
