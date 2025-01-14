import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    super.key,
    this.onPressed,
    this.shouldFocusAttention = false,
    required this.text,
  });

  final VoidCallback? onPressed;
  final bool shouldFocusAttention;
  final String text;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: shouldFocusAttention ? themeData.colorScheme.primary : themeData.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: themeData.textTheme.titleMedium?.copyWith(
            color: shouldFocusAttention ? themeData.colorScheme.onPrimary : themeData.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
