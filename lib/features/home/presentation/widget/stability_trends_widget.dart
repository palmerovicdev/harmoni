import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/emotional_stability_calculator.dart';
import '../../model/model/mood_track_model.dart';

class StabilityTrendData {
  final DateTime date;
  final double stabilityScore;
  final int measurementCount;

  StabilityTrendData({
    required this.date,
    required this.stabilityScore,
    required this.measurementCount,
  });
}

class StabilityTrendsWidget extends StatelessWidget {
  final List<MoodTrack> moodTracks;

  const StabilityTrendsWidget({
    super.key,
    required this.moodTracks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trendData = _analyzeTrends();
    final trendInsight = _generateTrendInsight(trendData);

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
                  Icons.trending_up,
                  color: Colors.green[600],
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Tendencias de Estabilidad',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Evolución de tu estabilidad emocional',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            if (trendData.isEmpty)
              _buildEmptyState(theme)
            else
              Column(
                children: [
                  if (trendInsight.isNotEmpty) _buildTrendInsight(trendInsight, theme),
                  const SizedBox(height: 20),
                  _buildTrendChart(trendData, theme),
                  const SizedBox(height: 16),
                  _buildTrendStats(trendData, theme),
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
            Icons.show_chart,
            size: 32,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'Necesitas más registros para analizar tendencias',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTrendInsight(String insight, ThemeData theme) {
    final isPositive = insight.contains('mejorado') || insight.contains('aumentado');
    final color = isPositive ? Colors.green : Colors.orange;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color[100]!,
            color[50]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color[700],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              insight,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color[800],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendChart(List<StabilityTrendData> trendData, ThemeData theme) {
    if (trendData.length < 2) return const SizedBox();

    final spots = trendData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.stabilityScore);
    }).toList();

    final maxY = trendData.map((d) => d.stabilityScore).reduce((a, b) => a > b ? a : b);
    final minY = trendData.map((d) => d.stabilityScore).reduce((a, b) => a < b ? a : b);

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey[300]!,
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: (trendData.length / 4).ceilToDouble(),
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < trendData.length) {
                    final date = trendData[index].date;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '${date.day}/${date.month}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
                reservedSize: 30,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (trendData.length - 1).toDouble(),
          minY: (minY - 10).clamp(0, 100),
          maxY: (maxY + 10).clamp(0, 100),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: LinearGradient(
                colors: [
                  Colors.green[300]!,
                  Colors.green[600]!,
                ],
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.green[600]!,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.green[100]!.withValues(alpha: 0.3),
                    Colors.green[50]!.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 40,
                color: Colors.orange[400]!,
                strokeWidth: 2,
                dashArray: [10, 5],
                label: HorizontalLineLabel(
                  show: true,
                  labelResolver: (line) => 'Umbral 40%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.orange[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendStats(List<StabilityTrendData> trendData, ThemeData theme) {
    final currentStability = trendData.last.stabilityScore;
    final previousStability = trendData.length > 1 ? trendData[trendData.length - 2].stabilityScore : currentStability;
    final change = currentStability - previousStability;

    final averageStability = trendData.map((d) => d.stabilityScore).reduce((a, b) => a + b) / trendData.length;
    final isImproving = change > 0;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Actual',
            '${currentStability.toStringAsFixed(1)}%',
            isImproving ? Icons.trending_up : Icons.trending_down,
            isImproving ? Colors.green : Colors.red,
            theme,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Cambio',
            '${change >= 0 ? '+' : ''}${change.toStringAsFixed(1)}%',
            isImproving ? Icons.arrow_upward : Icons.arrow_downward,
            isImproving ? Colors.green : Colors.red,
            theme,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Promedio',
            '${averageStability.toStringAsFixed(1)}%',
            Icons.insights,
            Colors.blue,
            theme,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  List<StabilityTrendData> _analyzeTrends() {
    if (moodTracks.isEmpty) return [];

    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));

    final Map<int, List<MoodTrack>> weeklyTracks = {};

    for (final track in moodTracks) {
      if (track.createdAt != null && track.createdAt!.isAfter(thirtyDaysAgo)) {
        final daysSinceStart = track.createdAt!.difference(thirtyDaysAgo).inDays;
        final weekIndex = daysSinceStart ~/ 7;
        weeklyTracks.putIfAbsent(weekIndex, () => []).add(track);
      }
    }

    final List<StabilityTrendData> trendData = [];

    for (final entry in weeklyTracks.entries) {
      final weekIndex = entry.key;
      final tracks = entry.value;

      if (tracks.length < 2) continue;

      final stabilityScore = EmotionalStabilityCalculator.calculateStabilityScore(tracks);

      final weekStartDate = thirtyDaysAgo.add(Duration(days: weekIndex * 7));
      final weekMidDate = weekStartDate.add(const Duration(days: 3));

      trendData.add(StabilityTrendData(
        date: weekMidDate,
        stabilityScore: stabilityScore,
        measurementCount: tracks.length,
      ));
    }

    trendData.sort((a, b) => a.date.compareTo(b.date));

    return trendData;
  }

  String _generateTrendInsight(List<StabilityTrendData> trendData) {
    if (trendData.length < 2) return '';

    final firstWeek = trendData.first.stabilityScore;
    final lastWeek = trendData.last.stabilityScore;
    final change = lastWeek - firstWeek;
    final changePercentage = firstWeek > 0 ? (change / firstWeek) * 100 : 0;

    if (change > 5.0) {
      return 'Tu estabilidad ha mejorado ${change.toStringAsFixed(1)}% este mes 📈';
    } else if (change < -5.0) {
      return 'Tu estabilidad ha disminuido ${(-change).toStringAsFixed(1)}% este mes 📉';
    } else if (lastWeek > 70.0) {
      return 'Mantienes una excelente estabilidad emocional ✨';
    } else if (lastWeek < 40.0) {
      return 'Tu estabilidad necesita atención. Considera técnicas de bienestar 🌱';
    } else {
      return 'Tu estabilidad se mantiene en un nivel moderado 📊';
    }
  }
}
