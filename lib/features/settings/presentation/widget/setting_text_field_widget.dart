import 'package:flutter/material.dart';

class SettingTextFieldWidget extends StatelessWidget {
  const SettingTextFieldWidget({
    super.key,
    required this.textController,
    this.leading,
    this.onValueChanged,
  });

  final TextEditingController textController;
  final Widget? leading;
  final Function? onValueChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      onChanged: (_) => onValueChanged?.call(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        prefixIcon: leading != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: leading,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
          gapPadding: 16,
        ),
      ),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
