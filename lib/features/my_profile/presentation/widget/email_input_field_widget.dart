import 'package:flutter/material.dart';
import 'package:harmoni/core/extensions/string.dart';

class EmailInputFieldWidget extends StatefulWidget {
  const EmailInputFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final Function(bool isValid)? onChanged;

  @override
  State<EmailInputFieldWidget> createState() => _EmailInputFieldWidgetState();
}

class _EmailInputFieldWidgetState extends State<EmailInputFieldWidget> {
  var isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onEditingComplete: () {
        widget.onChanged?.call(widget.controller.text.isEmailOnly);
      },
      onChanged: (value) => setState(() {
        if (value.isEmpty) {
          isValid = true;
          return;
        }
        isValid = widget.controller.text.isEmailOnly;
        widget.onChanged?.call(isValid);
      }),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        errorStyle: TextStyle(),
        error: isValid
            ? null
            : Text(
                'Email inválido.',
                softWrap: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        errorBorder: OutlineInputBorder(
          borderSide: !isValid ? BorderSide(color: Theme.of(context).colorScheme.error) : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black12),
        ),
        prefixIcon: Icon(
          Icons.email_rounded,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
