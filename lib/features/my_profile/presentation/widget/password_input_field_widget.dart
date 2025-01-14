import 'package:flutter/material.dart';

class PasswordInputFieldWidget extends StatefulWidget {
  const PasswordInputFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordInputFieldWidget> createState() => _PasswordInputFieldWidgetState();
}

class _PasswordInputFieldWidgetState extends State<PasswordInputFieldWidget> {
  var shouldShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !shouldShowPassword,
      obscuringCharacter: '•',
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
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
          child: Icon(Icons.lock_outline_rounded, size: 20,),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                shouldShowPassword = !shouldShowPassword;
              });
            },
            icon: Icon(
              !shouldShowPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
