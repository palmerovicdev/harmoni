import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/home/data/repository/home_repository.dart';

import '../model/response/home_summary_data.dart';

class HomeService {
  HomeSummaryData? homeSummaryData;
  final HomeRepository _homeRepository;
  var currentLocationIndex = 0;

  HomeService({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  void homeSummary() async {
    homeSummaryData = HomeSummaryData();

    var userId = getMyProfileService().userProfile?.id;
    if (userId == null) return;

    var moodTracksFromLastWeek = await _homeRepository.getMoodsByUserIdAndCreatedAt(userId, DateTime.now().add(Duration(days: -7)));

    var activitiesFromMoods = await _homeRepository.getActivitiesByMoodIds(
      moodTracksFromLastWeek.map((e) => e.id!).toList(),
    );
  }

  bool thereAreMoodsToDisplay() {
    return homeSummaryData?.moodTracks?.isNotEmpty ?? false;
  }
}
