import 'package:flutter/material.dart';

class NameInputFieldWidget extends StatelessWidget {
  const NameInputFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => onChanged?.call(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Define el radio de las esquinas.
            borderSide: BorderSide(color: Colors.black12),
            gapPadding: 16 // Sin borde visible.
            ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.black12), gapPadding: 16 // Sin borde visible.
            ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.black12), gapPadding: 16 // Sin borde visible.
            ),
      ),
    );
  }
}
