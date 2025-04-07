import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';

class PasswordInputFieldWidget extends StatefulWidget {
  const PasswordInputFieldWidget({
    super.key,
    required this.controller,
    this.shouldValidate = true,
    this.validatePassword,
    this.isValidByDefault,
  });

  final TextEditingController controller;
  final bool shouldValidate;
  final bool? isValidByDefault;

  final Function? validatePassword;

  @override
  State<PasswordInputFieldWidget> createState() => _PasswordInputFieldWidgetState();
}

class _PasswordInputFieldWidgetState extends State<PasswordInputFieldWidget> {
  var shouldShowPassword = false;
  var isValid = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    if (widget.isValidByDefault != null) isValid = widget.isValidByDefault!;
    return TextField(
      obscureText: !shouldShowPassword,
      obscuringCharacter: '•',
      controller: widget.controller,
      onChanged: (value) {
        if (value.isEmpty) {
          isValid = true;
          return;
        }
        if (widget.isValidByDefault != null) {
          widget.validatePassword?.call();
        } else {
          setState(() {
            isValid = getMyProfileService().validatePassword(value) == PasswordValidationResult.success.name;
          });
        }
      },
      decoration: InputDecoration(
        errorText: !isValid ? 'Contraseña invalida.' : null,
        errorBorder: OutlineInputBorder(
          borderSide: !isValid ? BorderSide(color: Colors.red) : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: theme.primary.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
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
            Icons.lock_rounded,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
