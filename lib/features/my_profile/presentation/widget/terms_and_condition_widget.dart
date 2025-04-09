import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/utils.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({
    super.key,
    this.onChanged,
  });

  final Function(bool value)? onChanged;

  @override
  State<TermsAndConditionWidget> createState() => _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme.bodyLarge;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.12,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) => setState(() {
                isChecked = value ?? false;
                widget.onChanged?.call(isChecked);
              }),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.75,
          child: Wrap(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'He leído y acepto los ',
                      style: textTheme?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Términos & Condiciones',
                      style: textTheme?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          safePrint('Tap');
                        },
                    ),
                    TextSpan(
                      text: ' y la ',
                      style: textTheme?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Política de Privacidad',
                      style: textTheme?.copyWith(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
