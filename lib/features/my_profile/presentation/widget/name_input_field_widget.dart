import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

class NameInputFieldWidget extends StatefulWidget {
  const NameInputFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.shouldShowBigNameField = true,
  });

  final TextEditingController controller;
  final Function(bool isValid)? onChanged;
  final bool shouldShowBigNameField;

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
      textAlign: widget.shouldShowBigNameField ? TextAlign.center : TextAlign.start,
      style: widget.shouldShowBigNameField
          ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500,
              )
          : Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        errorStyle: TextStyle(),
        error: !isValid
            ? Text(
                'Nombre invalido. Debe contener sólo letras y el primer carácter debe ser mayúscula.',
                softWrap: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              )
            : null,
        contentPadding: widget.shouldShowBigNameField ? EdgeInsets.symmetric(vertical: 24) : EdgeInsets.only(left: 16),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        errorBorder: OutlineInputBorder(
          borderSide: !isValid ? BorderSide(color: Theme.of(context).colorScheme.error) : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Define el radio de las esquinas.
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
      ),
    );
  }
}
