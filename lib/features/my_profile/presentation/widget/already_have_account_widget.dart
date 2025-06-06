import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/utils.dart';

import '../../../../router/general_routes.dart';

class AlreadyHaveAccountOrNotWidget extends StatefulWidget {
  const AlreadyHaveAccountOrNotWidget({super.key, required this.isSignUp});

  final bool isSignUp;

  @override
  State<AlreadyHaveAccountOrNotWidget> createState() => _AlreadyHaveAccountOrNotWidgetState();
}

class _AlreadyHaveAccountOrNotWidgetState extends State<AlreadyHaveAccountOrNotWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.isSignUp ? 'Ya posee una cuenta? ' : 'No posee una cuenta? ',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark(context) ? Colors.white54 : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: widget.isSignUp ? 'Autenticarse' : 'Crear Cuenta',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => widget.isSignUp ? context.pushNamed(MyProfileRoute.signIn.data.name) : context.pushNamed(MyProfileRoute.signUp.data.name),
          ),
        ],
      ),
      softWrap: true,
    );
  }
}
