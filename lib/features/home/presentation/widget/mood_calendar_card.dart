import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoni/generated/assets.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class MonthlyMoodCalendar extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const MonthlyMoodCalendar({super.key, required this.moodTracks});

  @override
  State<MonthlyMoodCalendar> createState() => _MonthlyMoodCalendarState();
}

class _MonthlyMoodCalendarState extends State<MonthlyMoodCalendar> {
  var now = DateTime.now();

  DateTime get currentMonth => DateTime(now.year, now.month, 1);

  Map<DateTime, EmotionType> _dominantByDay() {
    final Map<DateTime, Map<EmotionType, int>> counts = {};

    final monthStart = currentMonth;
    final monthEnd = DateTime(now.year, now.month + 1, 0);

    for (final track in widget.moodTracks) {
      final created = track.createdAt ?? now;
      final dateKey = DateTime(created.year, created.month, created.day).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

      if (dateKey.isBefore(monthStart) || dateKey.isAfter(monthEnd)) {
        continue;
      }

      final emo = _parseEmotion(track.imageMood) ?? _parseEmotion(track.recordMood) ?? EmotionType.other;

      counts.putIfAbsent(dateKey, () => {});
      counts[dateKey]![emo] = (counts[dateKey]![emo] ?? 0) + 1;
    }

    return counts.map((day, map) {
      final emo = map.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      return MapEntry(day, emo);
    });
  }

  List<DateTime> _getDaysInMonth() {
    final monthStart = currentMonth;
    final monthEnd = DateTime(now.year, now.month + 1, 0);
    final startOfWeek = monthStart.subtract(Duration(days: monthStart.weekday - 1));
    final endOfWeek = monthEnd.add(Duration(days: 7 - monthEnd.weekday));

    final days = <DateTime>[];
    for (var day = startOfWeek; day.isBefore(endOfWeek.add(Duration(days: 1))); day = day.add(Duration(days: 1))) {
      days.add(day);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final dominant = _dominantByDay();
    final daysInMonth = _getDaysInMonth();
    final monthName = DateFormat('MMMM, yyyy').format(now);

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
                Text(
                  'Calendario de emociones',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
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
                  onPressed: () => setState(() {
                    now = DateTime(now.year, now.month - 1, now.day);
                  }),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                  ),
                ),
                Text(
                  monthName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    now = DateTime(now.year, now.month + 1, now.day);
                  }),
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom']
                  .map((day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: daysInMonth.length,
              itemBuilder: (context, index) {
                final day = daysInMonth[index];
                final isCurrentMonth = day.month == now.month;
                final isToday = _isSameDay(day, DateTime.now());
                final emotion = dominant[DateTime(day.year, day.month, day.day).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isToday ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : null,
                    border: isToday
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '${day.day}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: isCurrentMonth ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                              ),
                        ),
                      ),
                      if (emotion != null && isCurrentMonth)
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: emotionColors[emotion]!.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                emotionAssets[emotion]!,
                                width: 14,
                                height: 14,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Toca cualquier día para ver más detalles',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

EmotionType? _parseEmotion(String? raw) {
  if (raw == null) return null;
  return EmotionType.values.firstWhere(
    (e) => e.name.toUpperCase() == raw.toUpperCase(),
    orElse: () => EmotionType.other,
  );
}
