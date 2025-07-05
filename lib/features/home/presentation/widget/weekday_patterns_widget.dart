import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class WeekdayMoodData {
  final int weekday;
  final EmotionType dominantEmotion;
  final double averageScore;
  final int measurementCount;
  final Map<EmotionType, int> emotionCounts;

  WeekdayMoodData({
    required this.weekday,
    required this.dominantEmotion,
    required this.averageScore,
    required this.measurementCount,
    required this.emotionCounts,
  });
}

class WeekdayPatternsWidget extends StatelessWidget {
  final List<MoodTrack> moodTracks;

  const WeekdayPatternsWidget({
    super.key,
    required this.moodTracks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weekdayData = _analyzeWeekdayPatterns();
    final insights = _generateInsights(weekdayData);

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
                  Icons.calendar_view_week,
                  color: Colors.purple[600],
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Patrones Semanales',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Analiza cómo te sientes cada día de la semana',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            if (weekdayData.isEmpty)
              _buildEmptyState(theme)
            else
              Column(
                children: [
                  if (insights.isNotEmpty) _buildInsightsSection(insights, theme),
                  const SizedBox(height: 20),
                  _buildWeekdayChart(weekdayData, theme),
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
            Icons.date_range,
            size: 32,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'Registra emociones durante la semana para ver patrones',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsSection(List<String> insights, ThemeData theme) {
    return Column(
      children: insights.take(2).map((insight) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple[100]!,
                Colors.purple[50]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple[200]!),
          ),
          child: Row(
            children: [
              Icon(
                Icons.lightbulb,
                color: Colors.purple[600],
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  insight,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.purple[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWeekdayChart(List<WeekdayMoodData> weekdayData, ThemeData theme) {
    const weekdayNames = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estado de ánimo por día',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            final weekday = index + 1;
            final data = weekdayData.firstWhere(
              (d) => d.weekday == weekday,
              orElse: () => WeekdayMoodData(
                weekday: weekday,
                dominantEmotion: EmotionType.neutral,
                averageScore: 0,
                measurementCount: 0,
                emotionCounts: {},
              ),
            );

            return _buildWeekdayColumn(data, weekdayNames[index], theme);
          }),
        ),
      ],
    );
  }

  Widget _buildWeekdayColumn(WeekdayMoodData data, String dayName, ThemeData theme) {
    final hasData = data.measurementCount > 0;
    final color = hasData ? emotionColors[data.dominantEmotion] ?? Colors.grey[300]! : Colors.grey[200]!;

    final normalizedHeight = hasData ? (data.averageScore / 10) * 60.0 : 10.0;

    return Column(
      children: [
        Container(
          height: 80,
          width: 32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (hasData)
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      emotionAssets[data.dominantEmotion]!,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              Container(
                height: normalizedHeight,
                width: 16,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          dayName,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: hasData ? FontWeight.bold : FontWeight.normal,
            color: hasData ? color : Colors.grey[500],
          ),
        ),
        if (hasData)
          Text(
            '${data.measurementCount}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
      ],
    );
  }

  List<WeekdayMoodData> _analyzeWeekdayPatterns() {
    if (moodTracks.isEmpty) return [];

    final Map<int, List<MoodTrack>> weekdayTracks = {};

    for (final track in moodTracks) {
      if (track.createdAt != null) {
        final weekday = track.createdAt!.weekday;
        weekdayTracks.putIfAbsent(weekday, () => []).add(track);
      }
    }

    final List<WeekdayMoodData> weekdayData = [];

    for (final entry in weekdayTracks.entries) {
      final weekday = entry.key;
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

      final dominantEmotion = emotionCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

      final averageScore = _calculateAverageScore(emotionCounts, tracks.length);

      weekdayData.add(WeekdayMoodData(
        weekday: weekday,
        dominantEmotion: dominantEmotion,
        averageScore: averageScore,
        measurementCount: tracks.length,
        emotionCounts: emotionCounts,
      ));
    }

    return weekdayData;
  }

  double _calculateAverageScore(Map<EmotionType, int> emotionCounts, int totalTracks) {
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

  List<String> _generateInsights(List<WeekdayMoodData> weekdayData) {
    if (weekdayData.length < 3) return [];

    final insights = <String>[];

    weekdayData.sort((a, b) => b.averageScore.compareTo(a.averageScore));

    if (weekdayData.isNotEmpty) {
      final bestDay = weekdayData.first;
      final worstDay = weekdayData.last;

      final bestDayName = _getSpanishWeekdayName(bestDay.weekday);
      final worstDayName = _getSpanishWeekdayName(worstDay.weekday);

      if (bestDay.averageScore > 6.0) {
        insights.add('Los $bestDayName sueles estar más ${_getEmotionSpanish(bestDay.dominantEmotion)}');
      }

      if (worstDay.averageScore < 5.0 && weekdayData.length > 1) {
        insights.add('Los $worstDayName pueden ser más desafiantes para ti');
      }

      final weekendData = weekdayData.where((d) => d.weekday == 6 || d.weekday == 7).toList();
      final weekdayWorkData = weekdayData.where((d) => d.weekday >= 1 && d.weekday <= 5).toList();

      if (weekendData.isNotEmpty && weekdayWorkData.isNotEmpty) {
        final weekendAvg = weekendData.map((d) => d.averageScore).reduce((a, b) => a + b) / weekendData.length;
        final weekdayAvg = weekdayWorkData.map((d) => d.averageScore).reduce((a, b) => a + b) / weekdayWorkData.length;

        if (weekendAvg > weekdayAvg + 1.0) {
          insights.add('Te sientes notablemente mejor los fines de semana');
        } else if (weekdayAvg > weekendAvg + 1.0) {
          insights.add('Mantienes mejor ánimo durante los días laborables');
        }
      }
    }

    return insights;
  }

  String _getSpanishWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'lunes';
      case 2:
        return 'martes';
      case 3:
        return 'miércoles';
      case 4:
        return 'jueves';
      case 5:
        return 'viernes';
      case 6:
        return 'sábados';
      case 7:
        return 'domingos';
      default:
        return 'días';
    }
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
