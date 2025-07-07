import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoni/core/helpers/utils.dart';

import '../../../../generated/assets.dart';

class MoodEntryCard extends StatelessWidget {
  final String moodLabel;
  final String moodEmoji;
  final String date;
  final String time;
  final List<String> tags;
  final String note;
  final VoidCallback? onShare;
  final VoidCallback? onMore;

  const MoodEntryCard({
    Key? key,
    required this.moodLabel,
    required this.moodEmoji,
    required this.date,
    required this.time,
    required this.tags,
    required this.note,
    this.onShare,
    this.onMore,
  }) : super(key: key);

  String _getEmojiAsset(String moodLabel) {
    switch (moodLabel.toLowerCase()) {
      case 'feliz':
      case 'happy':
        return Assets.circleHappyCircle;
      case 'triste':
      case 'sad':
        return Assets.circleSadCircle;
      case 'enfadado':
      case 'angry':
        return Assets.circleAngryCircle;
      case 'sorprendido':
      case 'surprise':
        return Assets.circleSurpriseCircle;
      case 'neutral':
        return Assets.circleNeutralCircle;
      case 'disgustado':
      case 'disgusted':
        return Assets.circleDisgustedCircle;
      case 'miedo':
      case 'fearful':
        return Assets.circleFearfulCircle;
      case 'guiño':
      case 'wink':
        return Assets.circleWinkCircle;
      default:
        return Assets.circleOtherCircle;
    }
  }

  Color _getMoodColor(String moodLabel) {
    return emotionColors[EmotionType.fromEmotionName(moodLabel.toLowerCase())] ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final moodColor = _getMoodColor(moodLabel);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            moodColor.withValues(alpha: 0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: moodColor.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {}, // Agregar funcionalidad si es necesario
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'mood_$date$time',
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              moodColor.withValues(alpha: 0.2),
                              moodColor.withValues(alpha: 0.1),
                            ],
                          ),
                          border: Border.all(
                            color: moodColor.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            _getEmojiAsset(moodLabel),
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  moodLabel,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                Assets.coreStar,
                                width: 16,
                                height: 16,
                                colorFilter: ColorFilter.mode(
                                  moodColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: moodColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '$date · $time',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: moodColor.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              Assets.coreShare,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                Colors.grey[600]!,
                                BlendMode.srcIn,
                              ),
                            ),
                            onPressed: onShare,
                            tooltip: 'Compartir',
                            splashRadius: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: moodColor.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: 20,
                              color: Colors.grey[600],
                            ),
                            onPressed: onMore,
                            tooltip: 'Más opciones',
                            splashRadius: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (tags.isNotEmpty) ...[
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((tag) {
                      final parts = tag.split(' ');
                      final emoji = parts.first;
                      final label = parts.sublist(1).join(' ');
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              moodColor.withValues(alpha: 0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: moodColor.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              emoji,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              label,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
                if (note.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: moodColor.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      note,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: moodColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.coreShootingStar,
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                              moodColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Registro guardado',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
