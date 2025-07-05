import '../../../features/home/model/model/mood_track_model.dart';

class EmotionalStabilityCalculator {
  static double calculateStabilityScore(List<MoodTrack> moodTracks) {
    if (moodTracks.isEmpty) return 0.0;

    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));

    final recentTracks = moodTracks.where((track) => track.createdAt != null && track.createdAt!.isAfter(thirtyDaysAgo)).toList();

    if (recentTracks.isEmpty) return 0.0;

    final Map<String, int> emotionCounts = {};
    for (final track in recentTracks) {
      final emotion = track.recordMood?.toLowerCase() ?? 'other';
      emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
    }

    if (emotionCounts.isEmpty) return 0.0;

    final mostFrequentCount = emotionCounts.values.reduce((a, b) => a > b ? a : b);
    final stabilityPercentage = (mostFrequentCount / recentTracks.length) * 100;

    return stabilityPercentage.clamp(0.0, 100.0);
  }

  static bool isStabilityBelowThreshold(List<MoodTrack> moodTracks, {double threshold = 40.0}) {
    final stabilityScore = calculateStabilityScore(moodTracks);
    return stabilityScore < threshold;
  }

  static String? getDominantEmotion(List<MoodTrack> moodTracks) {
    if (moodTracks.isEmpty) return null;

    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));

    final recentTracks = moodTracks.where((track) => track.createdAt != null && track.createdAt!.isAfter(thirtyDaysAgo)).toList();

    if (recentTracks.isEmpty) return null;

    final Map<String, int> emotionCounts = {};
    for (final track in recentTracks) {
      final emotion = track.recordMood?.toLowerCase() ?? 'other';
      emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
    }

    if (emotionCounts.isEmpty) return null;

    final dominantEmotion = emotionCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    return dominantEmotion;
  }

  static List<String> getRecommendations(double stabilityScore) {
    if (stabilityScore >= 70) {
      return [
        'Mantén tus hábitos actuales',
        'Continúa con tus actividades favoritas',
        'Sigue registrando tus emociones regularmente',
      ];
    } else if (stabilityScore >= 40) {
      return [
        'Intenta mantener rutinas estables',
        'Practica actividades que te relajen',
        'Considera hacer ejercicio regularmente',
        'Mantén conexiones sociales positivas',
      ];
    } else {
      return [
        'Practica técnicas de relajación como meditación',
        'Establece una rutina diaria consistente',
        'Busca apoyo en amigos y familiares',
        'Considera hablar con un profesional de la salud mental',
        'Limita el consumo de noticias negativas',
        'Prioriza un sueño de calidad',
        'Realiza actividades físicas suaves',
      ];
    }
  }
}
