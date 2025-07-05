import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/generated/assets.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class MoodCalendarPage extends StatefulWidget {
  const MoodCalendarPage({super.key});

  @override
  State<MoodCalendarPage> createState() => _MoodCalendarPageState();
}

class _MoodCalendarPageState extends State<MoodCalendarPage> {
  bool showMonthly = true;
  DateTime selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: showMonthly
                  ? _MonthlyCalendar(
                      moodTracks: getHomeService().homeSummaryData?.moodTracks ?? [],
                      month: selectedMonth,
                      onMonthChanged: (newMonth) => setState(() => selectedMonth = newMonth),
                    )
                  : _YearInPixels(
                      moodTracks: getHomeService().homeSummaryData?.moodTracks ?? [],
                      year: selectedMonth.year,
                      onYearChanged: (newYear) => setState(() => selectedMonth = DateTime(newYear, selectedMonth.month)),
                    ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => showMonthly = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: showMonthly ? colorScheme.tertiary : colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                              color: showMonthly ? colorScheme.onTertiary : colorScheme.onSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => showMonthly = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: !showMonthly ? colorScheme.tertiary : colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Yearly',
                            style: TextStyle(
                              color: !showMonthly ? colorScheme.onTertiary : colorScheme.onSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _MonthlyCalendar extends StatelessWidget {
  final List<MoodTrack> moodTracks;
  final DateTime month;
  final ValueChanged<DateTime> onMonthChanged;

  const _MonthlyCalendar({
    required this.moodTracks,
    required this.month,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = lastDayOfMonth.day;

    final moodByDay = <int, MoodTrack>{};
    for (var track in moodTracks) {
      if (track.createdAt != null && track.createdAt!.year == month.year && track.createdAt!.month == month.month) {
        moodByDay[track.createdAt!.day] = track;
      }
    }
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => onMonthChanged(DateTime(month.year, month.month - 1)),
                ),
                Text(
                  DateFormat('MMMM, yyyy').format(month),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => onMonthChanged(DateTime(month.year, month.month + 1)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map((d) => Expanded(
                        child: Center(
                          child: Text(d, style: TextStyle(fontWeight: FontWeight.w600, color: colorScheme.onSurface)),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: firstWeekday + daysInMonth + (42 - (firstWeekday + daysInMonth)),
                itemBuilder: (context, i) {
                  final dayNum = i - firstWeekday + 1;
                  if (i < firstWeekday || dayNum > daysInMonth) {
                    return const SizedBox.shrink();
                  }
                  final mood = moodByDay[dayNum];
                  final emotion = mood != null ? EmotionType.fromEmotionName(mood.recordMood ?? 'other') : null;
                  return GestureDetector(
                    onTap: mood != null
                        ? () {
                            // TODO: Mostrar detalles
                          }
                        : null,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 9,
                          backgroundColor: colorScheme.surfaceContainer,
                          child: SvgPicture.asset(
                            emotion != null ? emotionAssets[emotion]! : Assets.circleOtherCircle,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$dayNum',
                          style: TextStyle(
                            color: emotion != null ? colorScheme.tertiary : colorScheme.surfaceTint,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _YearInPixels extends StatelessWidget {
  final List<MoodTrack> moodTracks;
  final int year;
  final ValueChanged<int> onYearChanged;

  const _YearInPixels({
    required this.moodTracks,
    required this.year,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    final moodByMonthDay = <int, Map<int, MoodTrack>>{};
    for (var track in moodTracks) {
      if (track.createdAt != null && track.createdAt!.year == year) {
        moodByMonthDay.putIfAbsent(track.createdAt!.month, () => {});
        moodByMonthDay[track.createdAt!.month]![track.createdAt!.day] = track;
      }
    }

    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => onYearChanged(year - 1),
                ),
                Text(
                  '$year',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => onYearChanged(year + 1),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                12,
                (i) => Expanded(
                  child: Center(
                    child: Text(
                      DateFormat('MMM').format(DateTime(year, i + 1, 1)).substring(0, 1),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 31,
                itemBuilder: (context, dayIdx) {
                  return Row(
                    children: List.generate(12, (monthIdx) {
                      final day = dayIdx + 1;
                      final mood = moodByMonthDay[monthIdx + 1]?[day];
                      final emotion = mood != null ? EmotionType.fromEmotionName(mood.recordMood ?? 'other') : null;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundColor: colorScheme.surfaceContainer,
                            radius: 9,
                            child: SvgPicture.asset(emotion != null ? emotionAssets[emotion]! : Assets.circleOtherCircle),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
