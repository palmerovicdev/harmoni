import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/emotional_stability_calculator.dart';
import '../../model/model/mood_track_model.dart';

class MoodStabilityWidget extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const MoodStabilityWidget({super.key, required this.moodTracks});

  @override
  State<MoodStabilityWidget> createState() => _MoodStabilityWidgetState();
}

class _MoodStabilityWidgetState extends State<MoodStabilityWidget> {
  double _calculateStabilityScore() {
    return EmotionalStabilityCalculator.calculateStabilityScore(widget.moodTracks);
  }

  List<FlSpot> _getStabilityData() {
    final now = DateTime.now();
    final weeks = <FlSpot>[];

    for (int i = 6; i >= 0; i--) {
      final weekStart = now.subtract(Duration(days: i * 7));
      final weekEnd = weekStart.add(const Duration(days: 7));

      final weekTracks = widget.moodTracks.where((track) => track.createdAt != null && track.createdAt!.isAfter(weekStart) && track.createdAt!.isBefore(weekEnd)).toList();

      double weeklyStability = 0.0;
      if (weekTracks.isNotEmpty) {
        final Map<String, int> emotionCounts = {};

        for (final track in weekTracks) {
          final emotion = track.recordMood?.toLowerCase() ?? 'other';
          emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
        }

        if (emotionCounts.isNotEmpty) {
          final mostFrequentCount = emotionCounts.values.reduce((a, b) => a > b ? a : b);

          weeklyStability = (mostFrequentCount / weekTracks.length) * 100;
        }
      }

      weeks.add(FlSpot(6 - i.toDouble(), weeklyStability));
    }

    return weeks;
  }

  @override
  Widget build(BuildContext context) {
    final stabilityScore = _calculateStabilityScore();
    final stabilityData = _getStabilityData();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainer,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estabilidad del Estado de Ánimo',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            startDegreeOffset: -90,
                            sections: [
                              PieChartSectionData(
                                value: stabilityScore,
                                color: const Color(0xFF8CC154),
                                radius: 25,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                value: 100 - stabilityScore,
                                color: Colors.grey.shade300,
                                radius: 25,
                                showTitle: false,
                              ),
                            ],
                            sectionsSpace: 0,
                            centerSpaceRadius: 60,
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stabilityScore.round().toString(),
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              ),
                              Text(
                                '/ 100',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 120,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxX: 6,
                        minY: 0,
                        maxY: 100,
                        lineBarsData: [
                          LineChartBarData(
                            spots: stabilityData,
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF8CC154).withValues(alpha: 0.8),
                                const Color(0xFF8CC154),
                              ],
                            ),
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF8CC154).withValues(alpha: 0.3),
                                  const Color(0xFF8CC154).withValues(alpha: 0.1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              'Mientras más alto sea el puntaje, más estable eres.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
