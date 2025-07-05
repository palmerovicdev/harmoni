import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoni/generated/assets.dart';

import '../../model/model/mood_track_model.dart';

enum EmotionType { angry, fearful, happy, sad, neutral, disgusted, surprised, other }

const _emotionAssets = <EmotionType, String>{
  EmotionType.angry: Assets.circleAngryCircle,
  EmotionType.fearful: Assets.circleFearfulCircle,
  EmotionType.happy: Assets.circleHappyCircle,
  EmotionType.sad: Assets.circleSadCircle,
  EmotionType.neutral: Assets.circleNeutralCircle,
  EmotionType.disgusted: Assets.circleDisgustedCircle,
  EmotionType.surprised: Assets.circleSurpriseCircle,
  EmotionType.other: Assets.circleOtherCircle,
};

const _emotionColors = <EmotionType, Color>{
  EmotionType.angry: Color(0xFFf54334),
  EmotionType.fearful: Color(0xFFC045ED),
  EmotionType.happy: Color(0xFF8CC154),
  EmotionType.sad: Color(0xFFFF8C42),
  EmotionType.neutral: Color(0xFFFFBF2C),
  EmotionType.disgusted: Color(0xFF8373BA),
  EmotionType.surprised: Color(0xFF8CC154),
  EmotionType.other: Color(0xFFD3E3DD),
};

class AnnualMoodRadarWidget extends StatefulWidget {
  final List<MoodTrack> moodTracks;

  const AnnualMoodRadarWidget({super.key, required this.moodTracks});

  @override
  State<AnnualMoodRadarWidget> createState() => _AnnualMoodRadarWidgetState();
}

class _AnnualMoodRadarWidgetState extends State<AnnualMoodRadarWidget> {
  int currentYear = DateTime.now().year;

  /// Calcula los conteos de emociones para el año actual
  Map<EmotionType, int> _getEmotionCounts() {
    final Map<EmotionType, int> counts = {};

    // Filtrar por año actual
    final yearTracks = widget.moodTracks.where((track) => track.createdAt != null && track.createdAt!.year == currentYear).toList();

    for (final track in yearTracks) {
      final emotion = _parseEmotion(track.recordMood) ?? EmotionType.other;
      counts[emotion] = (counts[emotion] ?? 0) + 1;
    }

    return counts;
  }

  /// Obtiene el total de registros del año
  int _getTotalCount() {
    return widget.moodTracks.where((track) => track.createdAt != null && track.createdAt!.year == currentYear).length;
  }

  /// Obtiene todas las emociones para mostrar en el radar
  List<MapEntry<EmotionType, int>> _getAllEmotions() {
    final counts = _getEmotionCounts();

    // Obtener todas las emociones disponibles con sus conteos
    final allEmotions = <MapEntry<EmotionType, int>>[];

    // Usar todas las emociones del enum, excluyendo 'other' si no hay datos
    for (final emotion in EmotionType.values) {
      if (emotion == EmotionType.other && (counts[emotion] ?? 0) == 0) {
        continue; // Solo incluir 'other' si tiene datos
      }
      final count = counts[emotion] ?? 0;
      allEmotions.add(MapEntry(emotion, count));
    }

    // Ordenar por frecuencia (opcional, para mejor visualización)
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
            // Título del widget
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
            // Header con navegación de año
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
            // Gráfico radar
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
                      // Posicionar emojis y números en los puntos del radar
                      ...topEmotions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final emotionData = entry.value;
                        final emotion = emotionData.key;
                        final count = emotionData.value;

                        return _buildEmotionPoint(context, emotion, count, index, topEmotions.length, constraints.maxWidth, constraints.maxHeight);
                      }),
                      // Total en el centro
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
    // Calcular posición en el círculo
    final angle = (2 * math.pi * index / total) - (math.pi / 2); // -90° para empezar arriba
    final radius = math.min(containerWidth, containerHeight) / 3; // Radio para posicionar los emojis

    final centerX = containerWidth / 2;
    final centerY = containerHeight / 2;

    final x = radius * math.cos(angle);
    final y = radius * math.sin(angle);

    return Positioned(
      left: centerX + x - 30, // Centrar basándose en el tamaño real
      top: centerY + y - 40, // Centrar basándose en el tamaño real
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _emotionColors[emotion]!,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                _emotionAssets[emotion]!,
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

    // Encontrar el valor máximo para normalizar
    final maxValue = emotions.isEmpty ? 1 : emotions.map((e) => e.value).reduce(math.max);

    // Dibujar líneas de fondo del radar
    _drawRadarGrid(canvas, center, radius);

    // Dibujar el área rellena
    _drawFilledArea(canvas, center, radius, maxValue);

    // Dibujar líneas desde el centro a cada punto
    _drawRadarLines(canvas, center, radius);
  }

  void _drawRadarGrid(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Dibujar círculos concéntricos
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
      final pointRadius = radius * normalizedValue * 0.8; // 80% del radio máximo

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

    // Relleno del área
    final fillPaint = Paint()
      ..color = const Color(0xFF8CC154).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);

    // Borde del área
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

    // Dibujar líneas desde el centro a cada punto
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
