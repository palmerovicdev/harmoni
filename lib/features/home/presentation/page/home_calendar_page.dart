import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:intl/intl.dart';
import '../../model/model/mood_track_model.dart'; // Tu modelo

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Tabs
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => showMonthly = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color:
                          showMonthly ? Colors.green[600] : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                          color: showMonthly ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => showMonthly = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color:
                          !showMonthly ? Colors.green[600] : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Year in Pixels',
                        style: TextStyle(
                          color: !showMonthly ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: showMonthly
                ? _MonthlyCalendar(
                    moodTracks: getHomeService().homeSummaryData?.moodTracks ?? [],
                    month: selectedMonth,
                    onMonthChanged: (newMonth) =>
                        setState(() => selectedMonth = newMonth),
                  )
                : _YearInPixels(
                    moodTracks: getHomeService().homeSummaryData?.moodTracks ?? [],
                    year: selectedMonth.year,
                    onYearChanged: (newYear) => setState(() =>
                        selectedMonth = DateTime(newYear, selectedMonth.month)),
                  ),
          ),
        ],
      ),
    );
  }
}

enum EmotionType {
  ANGRY,
  FEARFUL,
  HAPPY,
  SAD,
  NEUTRAL,
  DISGUSTED,
  SURPRISED,
  OTHER,
}

const Map<EmotionType, Color> emotionColors = {
  EmotionType.ANGRY: Colors.red,
  EmotionType.FEARFUL: Colors.deepPurple,
  EmotionType.HAPPY: Colors.green,
  EmotionType.SAD: Colors.orange,
  EmotionType.NEUTRAL: Colors.yellow,
  EmotionType.DISGUSTED: Colors.brown,
  EmotionType.SURPRISED: Colors.blue,
  EmotionType.OTHER: Colors.grey,
};

const Map<EmotionType, String> emotionEmojis = {
  EmotionType.ANGRY: "😡",
  EmotionType.FEARFUL: "😨",
  EmotionType.HAPPY: "😄",
  EmotionType.SAD: "😕",
  EmotionType.NEUTRAL: "😐",
  EmotionType.DISGUSTED: "🤢",
  EmotionType.SURPRISED: "😲",
  EmotionType.OTHER: "🙂",
};

EmotionType parseEmotion(String? value) {
  if (value == null) return EmotionType.OTHER;
  return EmotionType.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
    orElse: () => EmotionType.OTHER,
  );
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
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0=Sun, 6=Sat
    final daysInMonth = lastDayOfMonth.day;

    // Map day -> MoodTrack
    final moodByDay = <int, MoodTrack>{};
    for (var track in moodTracks) {
      if (track.createdAt != null &&
          track.createdAt!.year == month.year &&
          track.createdAt!.month == month.month) {
        moodByDay[track.createdAt!.day] = track;
      }
    }

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Mes y navegación
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () =>
                      onMonthChanged(DateTime(month.year, month.month - 1)),
                ),
                Text(
                  DateFormat('MMMM, yyyy').format(month),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () =>
                      onMonthChanged(DateTime(month.year, month.month + 1)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Días de la semana
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map((d) => Expanded(
                        child: Center(
                          child: Text(d,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            // Días del mes
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: firstWeekday +
                    daysInMonth +
                    (42 - (firstWeekday + daysInMonth)), // 6 filas
                itemBuilder: (context, i) {
                  final dayNum = i - firstWeekday + 1;
                  if (i < firstWeekday || dayNum > daysInMonth) {
                    return const SizedBox.shrink();
                  }
                  final mood = moodByDay[dayNum];
                  final emotion = mood != null
                      ? parseEmotion(mood.imageMood)
                      : null;
                  return GestureDetector(
                    onTap: mood != null ? () {/* Mostrar detalles */} : null,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: emotion != null
                              ? emotionColors[emotion] ?? Colors.grey[300]
                              : Colors.grey[200],
                          child: Text(
                            emotion != null ? emotionEmojis[emotion]! : "🙂",
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$dayNum',
                          style: TextStyle(
                            color: emotion != null
                                ? Colors.black
                                : Colors.grey[400],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tap mood to see more details",
              style: TextStyle(color: Colors.grey, fontSize: 13),
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
    // Map [month][day] -> MoodTrack
    final moodByMonthDay = <int, Map<int, MoodTrack>>{};
    for (var track in moodTracks) {
      if (track.createdAt != null && track.createdAt!.year == year) {
        moodByMonthDay.putIfAbsent(track.createdAt!.month, () => {});
        moodByMonthDay[track.createdAt!.month]![track.createdAt!.day] = track;
      }
    }

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Año y navegación
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => onYearChanged(year - 1),
                ),
                Text(
                  '$year',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => onYearChanged(year + 1),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Meses
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                12,
                (i) => Expanded(
                  child: Center(
                    child: Text(
                      DateFormat('MMM')
                          .format(DateTime(year, i + 1, 1))
                          .substring(0, 1),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Días
            Expanded(
              child: ListView.builder(
                itemCount: 31,
                itemBuilder: (context, dayIdx) {
                  return Row(
                    children: List.generate(12, (monthIdx) {
                      final day = dayIdx + 1;
                      final mood = moodByMonthDay[monthIdx + 1]?[day];
                      final emotion = mood != null
                          ? parseEmotion(mood.imageMood)
                          : null;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: emotion != null
                                ? emotionColors[emotion] ?? Colors.grey[300]
                                : Colors.grey[200],
                            child: Text(
                              emotion != null ? emotionEmojis[emotion]! : "",
                              style: const TextStyle(fontSize: 13),
                            ),
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
