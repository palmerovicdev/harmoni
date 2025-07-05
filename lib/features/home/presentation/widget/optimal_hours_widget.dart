import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class HourlyMoodData {
  final int hour;
  final EmotionType dominantEmotion;
  final double positivityScore;
  final int measurementCount;

  HourlyMoodData({
    required this.hour,
    required this.dominantEmotion,
    required this.positivityScore,
    required this.measurementCount,
  });
}

class OptimalHoursWidget extends StatelessWidget {
  final List<MoodTrack> moodTracks;

  const OptimalHoursWidget({
    super.key,
    required this.moodTracks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hourlyData = _analyzeHourlyPatterns();
    final optimalHours = _getOptimalHours(hourlyData);

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
                  Icons.schedule,
                  color: Colors.orange[600],
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Tus Mejores Horarios',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Descubre en qué momentos del día te sientes mejor',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            if (hourlyData.isEmpty)
              _buildEmptyState(theme)
            else
              Column(
                children: [
                  _buildOptimalHoursSection(optimalHours, theme),
                  const SizedBox(height: 20),
                  _buildHourlyChart(hourlyData, theme),
                ],
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
            Icons.access_time,
            size: 32,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'Registra más emociones para ver tus patrones horarios',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOptimalHoursSection(
      List<HourlyMoodData> optimalHours, ThemeData theme) {
    if (optimalHours.isEmpty) return const SizedBox();

    final bestHour = optimalHours.first;
    final timeRange = _getTimeRangeString(bestHour.hour);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange[100]!,
            Colors.orange[50]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              emotionAssets[bestHour.dominantEmotion]!,
              height: 32,
              width: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🌟 Tu mejor momento del día',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Entre $timeRange sueles estar más ${_getEmotionSpanish(bestHour.dominantEmotion)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.orange[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Puntuación: ${bestHour.positivityScore.toStringAsFixed(1)}/10',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.orange[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyChart(List<HourlyMoodData> hourlyData, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Patrón diario',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (context, index) {
              final hourData = hourlyData.firstWhere(
                (data) => data.hour == index,
                orElse: () => HourlyMoodData(
                  hour: index,
                  dominantEmotion: EmotionType.neutral,
                  positivityScore: 0,
                  measurementCount: 0,
                ),
              );

              return _buildHourBar(hourData, theme);
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('00:00',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500])),
            Text('06:00',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500])),
            Text('12:00',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500])),
            Text('18:00',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500])),
            Text('24:00',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500])),
          ],
        ),
      ],
    );
  }

  Widget _buildHourBar(HourlyMoodData hourData, ThemeData theme) {
    final hasData = hourData.measurementCount > 0;
    final normalizedHeight =
        hasData ? (hourData.positivityScore / 10) * 40.0 : 5.0;
    final color = hasData
        ? emotionColors[hourData.dominantEmotion] ?? Colors.grey[300]!
        : Colors.grey[200]!;

    return Container(
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: normalizedHeight.toDouble(),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  List<HourlyMoodData> _analyzeHourlyPatterns() {
    if (moodTracks.isEmpty) return [];

    final Map<int, List<MoodTrack>> hourlyTracks = {};

    for (final track in moodTracks) {
      if (track.createdAt != null) {
        final hour = track.createdAt!.hour;
        hourlyTracks.putIfAbsent(hour, () => []).add(track);
      }
    }

    final List<HourlyMoodData> hourlyData = [];

    for (final entry in hourlyTracks.entries) {
      final hour = entry.key;
      final tracks = entry.value;

      if (tracks.isEmpty) continue;

      final Map<EmotionType, int> emotionCounts = {};
      for (final track in tracks) {
        if (track.recordMood != null) {
          final emotion = EmotionType.fromEmotionName(track.recordMood!);
          emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
        }
      }

      if (emotionCounts.isEmpty) continue;

      final dominantEmotion =
          emotionCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

      final positivityScore =
          _calculatePositivityScore(emotionCounts, tracks.length);

      hourlyData.add(HourlyMoodData(
        hour: hour,
        dominantEmotion: dominantEmotion,
        positivityScore: positivityScore,
        measurementCount: tracks.length,
      ));
    }

    return hourlyData;
  }

  double _calculatePositivityScore(
      Map<EmotionType, int> emotionCounts, int totalTracks) {
    double score = 0;

    for (final entry in emotionCounts.entries) {
      final emotion = entry.key;
      final count = entry.value;
      final weight = count / totalTracks;

      double emotionScore;
      switch (emotion) {
        case EmotionType.happy:
          emotionScore = 10.0;
          break;
        case EmotionType.surprised:
          emotionScore = 8.0;
          break;
        case EmotionType.neutral:
          emotionScore = 6.0;
          break;
        case EmotionType.other:
          emotionScore = 5.0;
          break;
        case EmotionType.disgusted:
          emotionScore = 3.0;
          break;
        case EmotionType.fearful:
          emotionScore = 2.0;
          break;
        case EmotionType.angry:
          emotionScore = 1.5;
          break;
        case EmotionType.sad:
          emotionScore = 1.0;
          break;
      }

      score += emotionScore * weight;
    }

    return score;
  }

  List<HourlyMoodData> _getOptimalHours(List<HourlyMoodData> hourlyData) {
    if (hourlyData.isEmpty) return [];

    final validHours = hourlyData
        .where((data) => data.measurementCount >= 2)
        .toList()
      ..sort((a, b) => b.positivityScore.compareTo(a.positivityScore));

    return validHours.take(3).toList();
  }

  String _getTimeRangeString(int hour) {
    final nextHour = (hour + 1) % 24;
    return '${hour.toString().padLeft(2, '0')}:00 - ${nextHour.toString().padLeft(2, '0')}:00';
  }

  String _getEmotionSpanish(EmotionType emotion) {
    switch (emotion) {
      case EmotionType.happy:
        return 'feliz';
      case EmotionType.sad:
        return 'triste';
      case EmotionType.angry:
        return 'enojado/a';
      case EmotionType.fearful:
        return 'temeroso/a';
      case EmotionType.neutral:
        return 'neutral';
      case EmotionType.surprised:
        return 'sorprendido/a';
      case EmotionType.disgusted:
        return 'disgustado/a';
      case EmotionType.other:
      default:
        return 'en balance';
    }
  }
}
