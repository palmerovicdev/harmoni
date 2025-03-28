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
      decoration: InputDecoration(
        errorText: !isValid ? 'Email invalido.' : null,
        errorBorder: !isValid
            ? OutlineInputBorder(
                borderSide: !isValid ? BorderSide(color: Colors.red) : BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Define el radio de las esquinas.
          borderSide: BorderSide.none, // Sin borde visible.
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 22.0, bottom: 22.0, right: 12),
          child: Icon(
            Icons.email_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
