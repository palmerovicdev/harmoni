import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harmoni/core/helpers/utils.dart';

import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';
import '../../model/model/mood_track_model.dart';

class ActivityEmotionAnalysis {
  final Activity activity;
  final EmotionType dominantEmotion;
  final double percentage;
  final int totalMeasurements;

  ActivityEmotionAnalysis({
    required this.activity,
    required this.dominantEmotion,
    required this.percentage,
    required this.totalMeasurements,
  });

  String get activityName => activity.name ?? 'Sin nombre';

  Color? get activityColor => activity.color != null ? Color(activity.color!) : null;
}

class ActivityEmotionPercentageWidget extends StatelessWidget {
  final List<MoodTrack> moodTracks;
  final List<Activity> activities;
  final List<MoodActivityRelation> relations;
  final String title;

  const ActivityEmotionPercentageWidget({
    super.key,
    required this.moodTracks,
    required this.activities,
    required this.relations,
    this.title = 'Emoción Dominante por Actividad',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final analyses = _analyzeEmotionsByActivity();

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Porcentaje de la emoción más frecuente en cada actividad',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            if (analyses.isEmpty) _buildEmptyState(theme) else ...analyses.map((analysis) => _buildActivityAnalysisCard(analysis, theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart,
            size: 40,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'No hay mediciones disponibles',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityAnalysisCard(ActivityEmotionAnalysis analysis, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: analysis.activity.color != null ? Color(analysis.activity.color!).withValues(alpha: 0.1) : Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: analysis.activity.color != null ? Color(analysis.activity.color!).withValues(alpha: 0.3) : Colors.blue[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      analysis.activityName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: analysis.activityColor ?? theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${analysis.totalMeasurements} mediciones',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: analysis.activityColor ?? theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${analysis.percentage.toStringAsFixed(1)}%',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      _getEmotionEmoji(analysis.dominantEmotion),
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _getEmotionLabel(analysis.dominantEmotion),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Emoción dominante',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildProgressBar(analysis.percentage, analysis.activityColor ?? theme.colorScheme.primary),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double percentage, Color color) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: percentage / 100,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  List<ActivityEmotionAnalysis> _analyzeEmotionsByActivity() {
    if (moodTracks.isEmpty || activities.isEmpty || relations.isEmpty) {
      return [];
    }

    final List<ActivityEmotionAnalysis> analyses = [];

    for (final activity in activities) {
      final activityRelations = relations.where((rel) => rel.activityId == activity.id).toList();

      if (activityRelations.isEmpty) {
        continue;
      }

      final relatedMoodTracks = moodTracks.where((track) {
        return activityRelations.any((rel) => rel.moodTrackId == track.hashCode);
      }).toList();

      if (relatedMoodTracks.isEmpty) {
        continue;
      }

      final Map<EmotionType, int> emotionCounts = {};
      for (final track in relatedMoodTracks) {
        if (track.recordMood != null) {
          final emotion = EmotionType.fromEmotionName(track.recordMood!);
          emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
        }
      }

      if (emotionCounts.isEmpty) {
        continue;
      }

      EmotionType dominantEmotion = EmotionType.other;
      int maxCount = 0;
      for (final entry in emotionCounts.entries) {
        if (entry.value > maxCount) {
          maxCount = entry.value;
          dominantEmotion = entry.key;
        }
      }

      final percentage = (maxCount / relatedMoodTracks.length) * 100;

      analyses.add(ActivityEmotionAnalysis(
        activity: activity,
        dominantEmotion: dominantEmotion,
        percentage: percentage,
        totalMeasurements: relatedMoodTracks.length,
      ));
    }

    analyses.sort((a, b) => b.percentage.compareTo(a.percentage));
    return analyses;
  }

  String _getEmotionEmoji(EmotionType emotion) {
    return emotionAssets[emotion] ?? emotionAssets[EmotionType.other]!;
  }

  String _getEmotionLabel(EmotionType emotion) {
    switch (emotion) {
      case EmotionType.happy:
        return 'Feliz';
      case EmotionType.sad:
        return 'Triste';
      case EmotionType.angry:
        return 'Enojado';
      case EmotionType.fearful:
        return 'Temeroso';
      case EmotionType.disgusted:
        return 'Disgustado';
      case EmotionType.surprised:
        return 'Sorprendido';
      case EmotionType.neutral:
        return 'Neutral';
      case EmotionType.other:
        return 'Otro';
    }
  }
}
