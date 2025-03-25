import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

class NameInputFieldWidget extends StatefulWidget {
  const NameInputFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final Function(bool isValid)? onChanged;

  @override
  State<NameInputFieldWidget> createState() => _NameInputFieldWidgetState();
}

class _NameInputFieldWidgetState extends State<NameInputFieldWidget> {
  var isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) => setState(() {
        if (value.isEmpty) {
          isValid = true;
          return;
        }
        isValid = getMyProfileService().validateNameStruct(value);
        widget.onChanged?.call(isValid);
      }),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        errorStyle: TextStyle(),
        error: !isValid
            ? Text(
                'Nombre invalido. Debe contener sólo letras y el primer carácter debe ser mayúscula.',
                softWrap: true,
                style: TextStyle(
                  color: Colors.red[800],
                ),
                textAlign: TextAlign.center,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 24),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        errorBorder: OutlineInputBorder(
          borderSide: !isValid ? BorderSide(color: Colors.red) : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
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
