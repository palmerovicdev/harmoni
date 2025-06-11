import 'package:dio/dio.dart';
import 'package:harmoni/core/connection/connection.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/home/model/model/mood_track_model.dart';

import '../../model/model/activity_model.dart';

abstract class HomeApi {
  Future<List<Activity>> getActivities();

  Future<void> createActivities(List<Activity> activities);

  Future<void> deleteActivity(int id);

  Future<void> trackEmotion(int activityId, String videoPath);

  Future<List<MoodTrack>> getEmotionsByActivity(int activityId);

  Future<List<MoodTrack>> getEmotions();
}

class HomeApiImpl implements HomeApi {
  final Connection _connectionService = getConnectionService();

  HomeApiImpl();

  @override
  Future<List<Activity>> getActivities() async {
    final response = await _connectionService.get(
      '${_connectionService.getBaseUrl()}/home/activities',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return (response.data['data'] as List).map((activity) => Activity.fromJson(activity)).toList();
  }

  @override
  Future<void> createActivities(List<Activity> activities) async {
    await _connectionService.post(
      '${_connectionService.getBaseUrl()}/home/createActivity',
      data: {'activities': activities.map((a) => a.toJson()).toList()},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  @override
  Future<void> deleteActivity(int id) async {
    await _connectionService.delete(
      '${_connectionService.getBaseUrl()}/home/deleteActivity/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  @override
  Future<void> trackEmotion(int activityId, String videoPath) async {
    final formData = FormData.fromMap({
      'videoFile': await MultipartFile.fromFile(videoPath),
      'activityId': activityId,
    });

    await _connectionService.post(
      '${_connectionService.getBaseUrl()}/home/trackEmotion',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
        contentType: 'multipart/form-data',
      ),
    );
  }

  @override
  Future<List<MoodTrack>> getEmotionsByActivity(int activityId) async {
    final response = await _connectionService.get(
      '${_connectionService.getBaseUrl()}/home/emotionsByActivity/$activityId',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return (response.data as List).map((emotion) => MoodTrack.fromJson(emotion)).toList();
  }

  @override
  Future<List<MoodTrack>> getEmotions() async {
    final response = await _connectionService.get(
      '${_connectionService.getBaseUrl()}/home/emotions',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return (response.data as List).map((emotion) => MoodTrack.fromJson(emotion)).toList();
  }
}
