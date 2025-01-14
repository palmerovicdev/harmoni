import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/utils.dart';

class AlreadyHaveAccountWidget extends StatefulWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  State<AlreadyHaveAccountWidget> createState() => _AlreadyHaveAccountWidgetState();
}

class _AlreadyHaveAccountWidgetState extends State<AlreadyHaveAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign in',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                safePrint('Tap');
              },
          ),
        ],
      ),
      softWrap: true,
    );
  }
}
