import 'package:flutter/material.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/spacer.dart';

class SettingActionWidget extends StatelessWidget {
  const SettingActionWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onPressed,
    this.action,
    this.color,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? action;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var colorWitOpacity = color?.withOpacity(0.05);
    var primaryWithOpacity = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: InkWell(
        splashColor: colorWitOpacity ?? primaryWithOpacity,
        highlightColor: colorWitOpacity ?? primaryWithOpacity,
        hoverColor: colorWitOpacity ?? primaryWithOpacity,
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorWitOpacity,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                if (leading != null) ...[
                  Space.smaller_small_w.gap,
                  leading!,
                  Space.small_w.gap,
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: color?..withOpacity(0.9),
                            ),
                      ),
                      subtitle != null
                          ? Text(
                              subtitle!,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: isDark(context) ? Colors.white54 : Colors.black54,
                                  ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                action ??
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: color,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
