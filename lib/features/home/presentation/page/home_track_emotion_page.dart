import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/widgets/emotional_stability_notification.dart';
import '../../../my_profile/service/my_profile_service.dart';
import '../../model/model/activity_model.dart';
import '../../service/home_service.dart';
import '../state_management/home_track_emotion_cubit.dart';
import '../state_management/home_track_emotion_state.dart';

class HomeTrackEmotionPage extends StatelessWidget {
  final HomeService homeService;

  const HomeTrackEmotionPage({
    required this.homeService,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocProvider(
      create: (_) => HomeTrackEmotionCubit(homeService: homeService),
      child: BlocConsumer<HomeTrackEmotionCubit, HomeTrackEmotionState>(
        listener: (context, state) {
          if (state.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Guardado con éxito!')),
            );

            if (state.showStabilityNotification && state.stabilityScore != null) {
              EmotionalStabilityNotificationOverlay.show(
                context,
                stabilityScore: state.stabilityScore!,
                onActionPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ver recomendaciones para mejorar tu estabilidad emocional'),
                    ),
                  );
                },
              );

              context.read<HomeTrackEmotionCubit>().dismissStabilityNotification();
            }

            Navigator.pop(context);
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<HomeTrackEmotionCubit>();
          final theme = Theme.of(context);
          var activities2 = activities;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Agregar emoción'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Nota rápida',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        minLines: 3,
                        maxLines: 5,
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: '¿Cómo te sentiste hoy?',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Actividad',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<Activity>(
                      value: state.selectedActivity,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      hint: const Text('Selecciona una actividad'),
                      items: activities2.map((activity) {
                        return DropdownMenuItem<Activity>(
                          value: activity,
                          child: Text(activity.name ?? 'Sin nombre'),
                        );
                      }).toList(),
                      onChanged: (Activity? activity) {
                        cubit.selectActivity(activity);
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Video',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    state.video == null
                        ? ElevatedButton.icon(
                            icon: const Icon(Icons.videocam, size: 28),
                            label: const Text('Grabar Video', style: TextStyle(fontSize: 18)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () async {
                              final videoPath = await context.pushNamed(HomeRoute.camera.data.name);
                              if (videoPath != null) {
                                cubit.setVideo(File(videoPath as String));
                              }
                            },
                          )
                        : Card(
                            color: Colors.green[50],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: ListTile(
                              leading: Icon(
                                Icons.videocam,
                                color: theme.colorScheme.primary,
                              ),
                              title: const Text('Video listo'),
                              subtitle: Text(state.video!.path.split('/').last),
                              trailing: IconButton(
                                icon: const Icon(Icons.close, color: Colors.red),
                                onPressed: () => cubit.setVideo(null),
                              ),
                            ),
                          ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: (state.loading || state.selectedActivity == null || state.video == null)
                          ? null
                          : () => {
                                cubit.updateNote(controller.text),
                                cubit.save(),
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.onInverseSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text('Guardar', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
