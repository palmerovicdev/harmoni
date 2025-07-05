import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoni/generated/assets.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class WeeklyMoodChart extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const WeeklyMoodChart({super.key, required this.moodTracks});

  @override
  State<WeeklyMoodChart> createState() => _WeeklyMoodChartState();
}

class _WeeklyMoodChartState extends State<WeeklyMoodChart> {
  var now = DateTime.now();

  DateTime monday() => now.subtract(Duration(days: now.weekday - 1)).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  Map<DateTime, EmotionType> _dominantByDay() {
    // Normalizamos sólo esta semana (lunes-domingo)
    final Map<DateTime, Map<EmotionType, int>> counts = {};

    for (final track in widget.moodTracks) {
      final created = track.createdAt ?? now;
      final dateKey = DateTime(created.year, created.month, created.day).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

      // salta si no pertenece a la semana actual
      if ((dateKey.isBefore(monday()) || dateKey.isAfter(monday().add(const Duration(days: 6)))) && dateKey != monday()) {
        continue;
      }

      final emo = _parseEmotion(track.recordMood) ?? EmotionType.other;

      counts.putIfAbsent(dateKey, () => {});
      counts[dateKey]![emo] = (counts[dateKey]![emo] ?? 0) + 1;
    }

    // top-1 por día
    return counts.map((day, map) {
      final emo = map.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      return MapEntry(day, emo);
    });
  }

  /// Labels L-D
  List<DateTime> _weekDays() {
    final monday = now.subtract(Duration(days: now.weekday - 1)).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final dominant = _dominantByDay();
    final weekDays = _weekDays();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainer,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Emociones más repetidas', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Icon(Icons.bar_chart, color: Theme.of(context).colorScheme.tertiary),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(
                    () {
                      now = now.subtract(Duration(days: 7));
                    },
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                  ),
                ),
                Text(
                  DateFormat('MMM d –').format(weekDays.first) + DateFormat(' d, yyyy').format(weekDays.last),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => setState(
                    () {
                      now = now.add(Duration(days: 7));
                    },
                  ),
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 1,
                  barTouchData: BarTouchData(enabled: false),
                  gridData: FlGridData(
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: 0.125,
                        minIncluded: false,
                        showTitles: true,
                        reservedSize: 38,
                        getTitlesWidget: (value, meta) {
                          final idx = ((value - 0.125) * 8).toInt();
                          if (idx >= EmotionType.values.length) return const SizedBox();
                          final emo = EmotionType.values[idx];
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: SvgPicture.asset(emotionAssets[emo]!, width: 28, height: 28),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx >= weekDays.length) return const SizedBox();
                          final date = weekDays[idx];
                          return Text(DateFormat.E().format(date)[0]); // L,M,M,J,V,S,D
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: List.generate(weekDays.length, (i) {
                    final day = weekDays[i];
                    final emo = dominant[day];
                    final color = emo != null ? emotionColors[emo]! : Colors.grey.shade300;
                    final toY = emo != null ? emotionAssets.keys.toList().indexOf(emo) / 8 + 0.125 : 0.0;

                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: toY,
                          color: color,
                          width: 20,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

EmotionType? _parseEmotion(String? raw) {
  if (raw == null) return null;
  return EmotionType.values.firstWhere(
    (e) => e.name.toUpperCase() == raw.toUpperCase(),
    orElse: () => EmotionType.other,
  );
}
