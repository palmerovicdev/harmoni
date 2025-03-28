import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';

import '../../../../core/helpers/utils.dart';

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
  var isValid = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return TextField(
      obscureText: !shouldShowPassword,
      obscuringCharacter: '•',
      controller: widget.controller,
      onChanged: (value) {
        if (value.isEmpty) {
          isValid = true;
          return;
        }
        isValid = getMyProfileService().validatePassword(value) == PasswordValidationResult.success.name;
      },
      decoration: InputDecoration(
        errorText: !isValid ? 'Contraseña invalida.' : null,
        errorBorder: OutlineInputBorder(
          borderSide: !isValid ? BorderSide(color: Colors.red) : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
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
            Icons.lock_outline_rounded,
            size: 20,
          ),
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
              color: isDark(context) ? Colors.white54 : Colors.black54,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
