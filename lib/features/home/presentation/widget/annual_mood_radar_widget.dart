import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/utils.dart';
import '../../model/model/mood_track_model.dart';

class AnnualMoodRadarWidget extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const AnnualMoodRadarWidget({super.key, required this.moodTracks});

  @override
  State<AnnualMoodRadarWidget> createState() => _AnnualMoodRadarWidgetState();
}

class _AnnualMoodRadarWidgetState extends State<AnnualMoodRadarWidget> {
  int currentYear = DateTime.now().year;

  Map<EmotionType, int> _getEmotionCounts() {
    final Map<EmotionType, int> counts = {};

    final yearTracks = widget.moodTracks.where((track) => track.createdAt != null && track.createdAt!.year == currentYear).toList();

    for (final track in yearTracks) {
      final emotion = _parseEmotion(track.recordMood) ?? EmotionType.other;
      counts[emotion] = (counts[emotion] ?? 0) + 1;
    }

    return counts;
  }

  int _getTotalCount() {
    return widget.moodTracks.where((track) => track.createdAt != null && track.createdAt!.year == currentYear).length;
  }

  List<MapEntry<EmotionType, int>> _getAllEmotions() {
    final counts = _getEmotionCounts();

    final allEmotions = <MapEntry<EmotionType, int>>[];

    for (final emotion in EmotionType.values) {
      if (emotion == EmotionType.other && (counts[emotion] ?? 0) == 0) {
        continue;
      }
      final count = counts[emotion] ?? 0;
      allEmotions.add(MapEntry(emotion, count));
    }

    allEmotions.sort((a, b) => b.value.compareTo(a.value));

    return allEmotions;
  }

  @override
  Widget build(BuildContext context) {
    final topEmotions = _getAllEmotions();
    final totalCount = _getTotalCount();

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
              'Conteo de Emociones Anual',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(() => currentYear--),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                ),
                Text(
                  currentYear.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  onPressed: currentYear < DateTime.now().year ? () => setState(() => currentYear++) : null,
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                ),
              ],
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: LayoutBuilder(builder: (context, constraints) {
                return CustomPaint(
                  painter: RadarChartPainter(
                    emotions: topEmotions,
                    totalCount: totalCount,
                  ),
                  child: Stack(
                    children: [
                      ...topEmotions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final emotionData = entry.value;
                        final emotion = emotionData.key;
                        final count = emotionData.value;

                        return _buildEmotionPoint(context, emotion, count, index, topEmotions.length, constraints.maxWidth, constraints.maxHeight);
                      }),
                      Center(
                        child: Text(
                          totalCount.toString(),
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionPoint(BuildContext context, EmotionType emotion, int count, int index, int total, double containerWidth, double containerHeight) {
    final angle = (2 * math.pi * index / total) - (math.pi / 2);
    final radius = math.min(containerWidth, containerHeight) / 3;

    final centerX = containerWidth / 2;
    final centerY = containerHeight / 2;

    final x = radius * math.cos(angle);
    final y = radius * math.sin(angle);

    return Positioned(
      left: centerX + x - 30,
      top: centerY + y - 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: emotionColors[emotion]!,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                emotionAssets[emotion]!,
                width: 30,
                height: 30,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<MapEntry<EmotionType, int>> emotions;
  final int totalCount;

  RadarChartPainter({required this.emotions, required this.totalCount});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 3;

    final maxValue = emotions.isEmpty ? 1 : emotions.map((e) => e.value).reduce(math.max);

    _drawRadarGrid(canvas, center, radius);

    _drawFilledArea(canvas, center, radius, maxValue);

    _drawRadarLines(canvas, center, radius);
  }

  void _drawRadarGrid(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(center, radius * i / 4, paint);
    }
  }

  void _drawFilledArea(Canvas canvas, Offset center, double radius, int maxValue) {
    if (emotions.isEmpty || maxValue == 0) return;

    final path = Path();
    bool isFirst = true;

    for (int i = 0; i < emotions.length; i++) {
      final angle = (2 * math.pi * i / emotions.length) - (math.pi / 2);
      final normalizedValue = emotions[i].value / maxValue;
      final pointRadius = radius * normalizedValue * 0.8;

      final x = center.dx + pointRadius * math.cos(angle);
      final y = center.dy + pointRadius * math.sin(angle);

      if (isFirst) {
        path.moveTo(x, y);
        isFirst = false;
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    final fillPaint = Paint()
      ..color = const Color(0xFF8CC154).withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);

    final strokePaint = Paint()
      ..color = const Color(0xFF8CC154)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path, strokePaint);
  }

  void _drawRadarLines(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i < emotions.length; i++) {
      final angle = (2 * math.pi * i / emotions.length) - (math.pi / 2);
      final endX = center.dx + radius * math.cos(angle);
      final endY = center.dy + radius * math.sin(angle);

      canvas.drawLine(center, Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

EmotionType? _parseEmotion(String? raw) {
  if (raw == null) return null;
  return EmotionType.values.firstWhere(
    (e) => e.name.toLowerCase() == raw.toLowerCase(),
    orElse: () => EmotionType.other,
  );
}
