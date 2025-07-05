import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';
import '../../model/model/mood_track_model.dart';

class ActivityEmotionCorrelation {
  final Activity activity;
  final EmotionType dominantEmotion;
  final double confidence;
  final int totalMeasurements;
  final String insight;

  ActivityEmotionCorrelation({
    required this.activity,
    required this.dominantEmotion,
    required this.confidence,
    required this.totalMeasurements,
    required this.insight,
  });
}

class ActivityEmotionCorrelationWidget extends StatelessWidget {
  final List<MoodTrack> moodTracks;
  final List<Activity> activities;
  final List<MoodActivityRelation> relations;

  const ActivityEmotionCorrelationWidget({
    super.key,
    required this.moodTracks,
    required this.activities,
    required this.relations,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final correlations = _analyzeCorrelations();

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Correlaciones Emocionales',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Descubre cómo diferentes actividades afectan tu estado de ánimo',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            if (correlations.isEmpty)
              _buildEmptyState(theme)
            else
              ...correlations.take(3).map(
                    (correlation) => _buildCorrelationCard(correlation, theme),
                  ),
            if (correlations.length > 3)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Y ${correlations.length - 3} patrones más...',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      height: 100,
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
            Icons.insights,
            size: 32,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'Necesitas más datos para ver correlaciones',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCorrelationCard(ActivityEmotionCorrelation correlation, ThemeData theme) {
    final activityColor = correlation.activity.color != null ? Color(correlation.activity.color!) : theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: activityColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: activityColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: activityColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  emotionAssets[correlation.dominantEmotion]!,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  correlation.insight,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: activityColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${correlation.confidence.toStringAsFixed(0)}% de confianza',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '${correlation.totalMeasurements} mediciones',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: correlation.confidence / 100,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(activityColor),
          ),
        ],
      ),
    );
  }

  List<ActivityEmotionCorrelation> _analyzeCorrelations() {
    if (moodTracks.isEmpty || activities.isEmpty || relations.isEmpty) {
      return [];
    }

    final List<ActivityEmotionCorrelation> correlations = [];

    for (final activity in activities) {
      final activityRelations = relations.where((rel) => rel.activityId == activity.id).toList();

      if (activityRelations.length < 3) {
        continue;
      }

      final relatedMoodTracks = moodTracks.where((track) {
        return activityRelations.any((rel) => rel.moodTrackId == track.hashCode);
      }).toList();

      if (relatedMoodTracks.isEmpty) continue;

      final Map<EmotionType, int> emotionCounts = {};
      for (final track in relatedMoodTracks) {
        if (track.recordMood != null) {
          final emotion = EmotionType.fromEmotionName(track.recordMood!);
          emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
        }
      }

      if (emotionCounts.isEmpty) continue;

      final dominantEntry = emotionCounts.entries.reduce((a, b) => a.value > b.value ? a : b);
      final dominantEmotion = dominantEntry.key;
      final dominantCount = dominantEntry.value;

      final confidence = (dominantCount / relatedMoodTracks.length) * 100;

      if (confidence >= 60.0) {
        final insight = _generateInsight(activity, dominantEmotion, confidence);

        correlations.add(ActivityEmotionCorrelation(
          activity: activity,
          dominantEmotion: dominantEmotion,
          confidence: confidence,
          totalMeasurements: relatedMoodTracks.length,
          insight: insight,
        ));
      }
    }

    correlations.sort((a, b) => b.confidence.compareTo(a.confidence));
    return correlations;
  }

  String _generateInsight(Activity activity, EmotionType emotion, double confidence) {
    final activityName = activity.name?.toLowerCase() ?? 'esta actividad';
    final emotionSpanish = _getEmotionSpanish(emotion);

    switch (emotion) {
      case EmotionType.happy:
        return 'Cuando $activityName, tiendes a sentirte más $emotionSpanish ✨';
      case EmotionType.sad:
        return '$activityName parece hacerte sentir $emotionSpanish 😔';
      case EmotionType.angry:
        return '$activityName está asociada con sentimientos de $emotionSpanish 😤';
      case EmotionType.fearful:
        return 'Notas que $activityName te genera $emotionSpanish ⚠️';
      case EmotionType.neutral:
        return '$activityName te mantiene en un estado $emotionSpanish ⚖️';
      case EmotionType.surprised:
        return '$activityName tiende a sorprenderte positivamente 🎉';
      case EmotionType.disgusted:
        return '$activityName parece generar sentimientos negativos 😰';
      case EmotionType.other:
      default:
        return '$activityName tiene un efecto emocional variable en ti 🤔';
    }
  }

  String _getEmotionSpanish(EmotionType emotion) {
    switch (emotion) {
      case EmotionType.happy:
        return 'feliz';
      case EmotionType.sad:
        return 'triste';
      case EmotionType.angry:
        return 'enojo';
      case EmotionType.fearful:
        return 'temor';
      case EmotionType.neutral:
        return 'neutral';
      case EmotionType.surprised:
        return 'sorprendido/a';
      case EmotionType.disgusted:
        return 'disgusto';
      case EmotionType.other:
      default:
        return 'diferente';
    }
  }
}
