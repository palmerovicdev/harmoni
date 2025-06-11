import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../model/model/mood_track_model.dart';

class MoodChartCard extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const MoodChartCard({Key? key, required this.moodTracks}) : super(key: key);

  @override
  State<MoodChartCard> createState() => _MoodChartCardState();
}

class _MoodChartCardState extends State<MoodChartCard> {
  String period = 'Weekly';

  List<String> get periods => ['Weekly', 'Monthly', 'Yearly', 'Lifetime'];

  List<EmotionType> get emotions => EmotionType.values;

  // Agrupa los MoodTrack por periodo y obtiene la emoción dominante
  Map<String, EmotionType> getDominantEmotionByPeriod() {
    Map<String, Map<EmotionType, int>> countByPeriod = {};
    for (var track in widget.moodTracks) {
      String key;
      if (period == 'Weekly') {
        key = DateFormat('yyyy-MM-dd').format(track.createdAt!);
      } else if (period == 'Monthly') {
        key = DateFormat('yyyy-MM').format(track.createdAt!);
      } else if (period == 'Yearly') {
        key = DateFormat('yyyy').format(track.createdAt!);
      } else {
        key = 'lifetime';
      }
      final emotion = parseEmotion(track.imageMood) ??
          parseEmotion(track.recordMood) ??
          EmotionType.OTHER;
      countByPeriod.putIfAbsent(key, () => {});
      countByPeriod[key]![emotion] = (countByPeriod[key]![emotion] ?? 0) + 1;
    }
    Map<String, EmotionType> dominant = {};
    countByPeriod.forEach((key, map) {
      EmotionType? maxEmotion;
      int maxCount = 0;
      map.forEach((emotion, count) {
        if (count > maxCount) {
          maxEmotion = emotion;
          maxCount = count;
        }
      });
      if (maxEmotion != null) dominant[key] = maxEmotion!;
    });
    return dominant;
  }

  List<String> getPeriodLabels() {
    if (period == 'Weekly') {
      final now = DateTime.now();
      final start = now.subtract(Duration(days: now.weekday - 1));
      return List.generate(7,
          (i) => DateFormat('yyyy-MM-dd').format(start.add(Duration(days: i))));
    } else if (period == 'Monthly') {
      final now = DateTime.now();
      final start = DateTime(now.year, now.month, 1);
      final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
      return List.generate(daysInMonth,
          (i) => DateFormat('yyyy-MM-dd').format(start.add(Duration(days: i))));
    } else if (period == 'Yearly') {
      final now = DateTime.now();
      return List.generate(12,
          (i) => DateFormat('yyyy-MM').format(DateTime(now.year, i + 1, 1)));
    } else {
      return ['lifetime'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final dominant = getDominantEmotionByPeriod();
    final periodLabels = getPeriodLabels();

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                Text('Mood Chart',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Icon(Icons.bar_chart, color: Colors.green[700]),
                const SizedBox(width: 8),
                Icon(Icons.show_chart, color: Colors.grey[400]),
                const SizedBox(width: 8),
                Icon(Icons.share, color: Colors.grey[400]),
              ],
            ),
            const SizedBox(height: 16),
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: periods.map((p) {
                final selected = p == period;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => period = p),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color:
                            selected ? Colors.green[600] : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          p,
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Fecha rango
            if (period == 'Weekly')
              Text(
                '${DateFormat('MMM dd').format(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)))} - ${DateFormat('MMM dd, yyyy').format(DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)))}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            if (period == 'Monthly')
              Text(
                DateFormat('MMMM yyyy').format(DateTime.now()),
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            if (period == 'Yearly')
              Text(
                DateFormat('yyyy').format(DateTime.now()),
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            if (period == 'Lifetime')
              const Text(
                'Lifetime',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            const SizedBox(height: 16),
            // Gráfico de barras
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 1.0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= EmotionType.values.length)
                            return const SizedBox.shrink();
                          final emotion = EmotionType.values[idx];
                          return Text(emotionEmojis[emotion]!,
                              style: const TextStyle(fontSize: 22));
                        },
                        reservedSize: 32,
                        interval: 1,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= periodLabels.length)
                            return const SizedBox.shrink();
                          final label = period == 'Yearly'
                              ? DateFormat('MMM').format(
                                  DateTime(DateTime.now().year, idx + 1, 1))
                              : periodLabels[idx].split('-').last;
                          return Text(label,
                              style: const TextStyle(fontSize: 12));
                        },
                        reservedSize: 28,
                        interval: 1,
                      ),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(periodLabels.length, (i) {
                    final key = periodLabels[i];
                    final emotion = dominant[key];
                    final emotionIdx = emotion != null
                        ? EmotionType.values.indexOf(emotion)
                        : -1;
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: emotionIdx >= 0 ? 1.0 : 0.0,
                          color: emotionIdx >= 0
                              ? emotionColors[EmotionType.values[emotionIdx]]
                              : Colors.grey[300],
                          width: 22,
                          borderRadius: BorderRadius.circular(8),
                          rodStackItems: [],
                        ),
                      ],
                      showingTooltipIndicators: [],
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

// Enum de emociones
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

// Mapeos de emociones a emoji y color
const Map<EmotionType, String> emotionEmojis = {
  EmotionType.ANGRY: "😡",
  EmotionType.FEARFUL: "😨",
  EmotionType.HAPPY: "😄",
  EmotionType.SAD: "😢",
  EmotionType.NEUTRAL: "😐",
  EmotionType.DISGUSTED: "🤢",
  EmotionType.SURPRISED: "😲",
  EmotionType.OTHER: "❓",
};

const Map<EmotionType, Color> emotionColors = {
  EmotionType.ANGRY: Colors.red,
  EmotionType.FEARFUL: Colors.deepPurple,
  EmotionType.HAPPY: Colors.green,
  EmotionType.SAD: Colors.blue,
  EmotionType.NEUTRAL: Colors.grey,
  EmotionType.DISGUSTED: Colors.brown,
  EmotionType.SURPRISED: Colors.orange,
  EmotionType.OTHER: Colors.black26,
};

// Función para parsear el string a EmotionType
EmotionType? parseEmotion(String? value) {
  if (value == null) return null;
  return EmotionType.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
    orElse: () => EmotionType.OTHER,
  );
}
