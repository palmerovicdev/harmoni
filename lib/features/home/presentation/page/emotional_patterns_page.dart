import 'package:flutter/material.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../model/model/activity_model.dart';
import '../../model/model/mood_activity_relation_model.dart';
import '../../model/model/mood_track_model.dart';
import '../widget/activity_emotion_correlation_widget.dart';
import '../widget/optimal_hours_widget.dart';
import '../widget/stability_trends_widget.dart';
import '../widget/weekday_patterns_widget.dart';

class EmotionalPatternsPage extends StatefulWidget {
  const EmotionalPatternsPage({super.key});

  @override
  State<EmotionalPatternsPage> createState() => _EmotionalPatternsPageState();
}

class _EmotionalPatternsPageState extends State<EmotionalPatternsPage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await getHomeService().homeSummary();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los datos: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final homeService = getHomeService();
    final List<MoodTrack> moodTracks = homeService.homeSummaryData?.moodTracks ?? [];
    final List<Activity> activities = homeService.homeSummaryData?.activities ?? [];
    // Por ahora usamos una lista vacía para relations, pero se puede obtener de la BD
    final List<MoodActivityRelation> relations = [];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Análisis de Patrones',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadData,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.psychology_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Detector de Patrones Emocionales',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Descubre insights profundos sobre tu bienestar emocional',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildStatChip(
                          'Registros',
                          '${moodTracks.length}',
                          Icons.timeline,
                          Colors.white,
                        ),
                        const SizedBox(width: 12),
                        _buildStatChip(
                          'Actividades',
                          '${activities.length}',
                          Icons.local_activity,
                          Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ActivityEmotionCorrelationWidget(
                moodTracks: moodTracks,
                activities: activities,
                relations: relations,
              ),
              OptimalHoursWidget(
                moodTracks: moodTracks,
              ),
              WeekdayPatternsWidget(
                moodTracks: moodTracks,
              ),
              StabilityTrendsWidget(
                moodTracks: moodTracks,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.blue[600],
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Consejos para mejor análisis',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• Registra tus emociones regularmente para obtener patrones más precisos\n'
                      '• Incluye diferentes actividades para diversificar el análisis\n'
                      '• Los patrones se vuelven más claros con al menos 2 semanas de datos\n'
                      '• Utiliza estos insights para planificar tu bienestar',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
