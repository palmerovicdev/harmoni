import 'package:flutter/material.dart';

class MoodEntryCard extends StatelessWidget {
  final String moodLabel;
  final String moodEmoji;
  final String date;
  final String time;
  final List<String> tags; // Ejemplo: ["😊 Calm", "🙏 Grateful"]
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.yellow[100],
                  child: Text(
                    moodEmoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        moodLabel,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$date · $time',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share, size: 22),
                      onPressed: onShare,
                      tooltip: 'Compartir',
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, size: 22),
                      onPressed: onMore,
                      tooltip: 'Más',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                final parts = tag.split(' ');
                final emoji = parts.first;
                final label = parts.sublist(1).join(' ');
                return Chip(
                  label: Text(label,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  avatar: Text(emoji, style: const TextStyle(fontSize: 18)),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text(
              note,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
