import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/features/home/presentation/widget/mood_entry_card.dart';
import 'package:harmoni/features/home/presentation/widget/mood_stability_widget.dart';
import 'package:harmoni/features/settings/presentation/page/style_setting_page.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../settings/presentation/state_management/style_setting/style_setting_cubit.dart';
import '../widget/annual_mood_radar_widget.dart';
import '../widget/weekly_mood_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProfileService = getMyProfileService();
    var moodTracks = getHomeService().homeSummaryData?.moodTracks;
    var theme = Theme.of(context);
    var entryCards = getHomeService()
            .homeSummaryData
            ?.moodTracks
            ?.map(
              (e) => MoodEntryCard(moodLabel: e.recordMood ?? '', moodEmoji: '', date: e.createdAt?.toString() ?? '', time: '', tags: [''], note: ''),
            )
            .toList() ??
        [];
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        var settings = myProfileService.userProfile?.settings;
        if (myProfileService.userProfile == null) {
          context.goNamed(MyProfileRoute.init.data.name);
        } else if (settings != null && settings['brightness'] != null && settings['color'] != null && settings['contrastLevel'] != null && settings['emojiType'] != null) {
          context.read<StyleSettingCubit>().changeAll(
                brightness: settings['brightness'] == Brightness.dark.name ? Brightness.dark : Brightness.light,
                color: colors.elementAt(settings['colorIndex'] ?? 0)['color'] as Color,
                contrastLevel: settings['contrastLevel'] ?? 0.0,
                emojiType: settings['emojiType'] ?? 'ghost',
                colorIndex: settings['colorIndex'] ?? 0,
              );
        }
      },
    );
    return Scaffold(
      floatingActionButton: IconButton(onPressed: () => context.pushNamed(HomeRoute.trackEmotion.data.name), icon: Icon(Icons.add)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 54,
            ),
            if (moodTracks?.isEmpty ?? true)
              Center(
                child: Text('No hay datos para mostrar', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ),
            if (moodTracks?.isNotEmpty ?? false) WeeklyMoodChart(moodTracks: moodTracks!),
            if (moodTracks?.isNotEmpty ?? false) MoodStabilityWidget(moodTracks: moodTracks!),
            if (moodTracks?.isNotEmpty ?? false) AnnualMoodRadarWidget(moodTracks: moodTracks!),
          ],
        ),
      ),
    );
  }
}
