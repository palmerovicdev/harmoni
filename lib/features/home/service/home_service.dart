import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/home/data/repository/home_repository.dart';

import '../../my_profile/service/my_profile_service.dart';
import '../model/response/home_summary_data.dart';

class HomeService {
  HomeSummaryData? homeSummaryData;
  final HomeRepository _homeRepository;
  var currentLocationIndex = 0;
  String response = '';

  HomeService({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  Future<void> homeSummary() async {
    homeSummaryData = HomeSummaryData();

    var userId = getMyProfileService().userProfile?.id;
    if (userId == null) return;

    var emotions = await _homeRepository.getEmotions();

    homeSummaryData?.activities = activities;
    homeSummaryData?.moodTracks = emotions;
  }

  bool thereAreMoodsToDisplay() {
    return homeSummaryData?.moodTracks?.isNotEmpty ?? false;
  }

  Future<void> trackEmotion(int activityId, String videoPath) async {
    await _homeRepository.trackEmotion(activityId, videoPath);
  }
}
