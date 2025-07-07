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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (moodTracks?.isEmpty ?? true) ...[
                SizedBox(height: 120),
                _buildEmptyState(context, theme),
              ],
              if (moodTracks?.isNotEmpty ?? false) WeeklyMoodChart(moodTracks: moodTracks!),
              if (moodTracks?.isNotEmpty ?? false) MoodStabilityWidget(moodTracks: moodTracks!),
              if (moodTracks?.isNotEmpty ?? false) AnnualMoodRadarWidget(moodTracks: moodTracks!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              Icons.mood,
              size: 64,
              color: theme.colorScheme.primary,
            ),
          ),
          SizedBox(height: 24),
          Text(
            '¡Bienvenido a Harmoni!',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'Comienza tu viaje de bienestar emocional registrando tu primera emoción',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () => context.pushNamed(HomeRoute.trackEmotion.data.name),
            icon: Icon(Icons.add_circle_outline),
            label: Text('Registrar primera emoción'),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: theme.colorScheme.secondary,
                  size: 20,
                ),
                SizedBox(height: 8),
                Text(
                  'Tip: Registra tus emociones regularmente para obtener insights valiosos sobre tu bienestar',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
