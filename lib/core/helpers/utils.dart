import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void safePrint(dynamic value) {
  if (kDebugMode) {
    print(value);
  }
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Error",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar"),
          ),
        ],
      );
    },
  );
}

Future<void> showConditionalDialog(
  BuildContext context,
  String message, {
  required Function() onAcceptPressed,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      var screenWidth = MediaQuery.sizeOf(context).width;
      return AlertDialog(
        title: Text(message),
        insetPadding: EdgeInsets.all(2),
        actionsPadding: EdgeInsets.only(bottom: 12, right: 16),
        content: SizedBox(
          height: 40,
          child: Row(
            children: [
              CheckBoxWidget(
                screenWidth: screenWidth,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'No mostrar otra vez',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary.withOpacity(0.05)),
              surfaceTintColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary.withOpacity(0.05)),
              backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary.withOpacity(0.05)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12)
              ))
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              onAcceptPressed.call();
              Navigator.of(context).pop();
            },
            child: const Text("Continuar"),
          ),
        ],
      );
    },
  );
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.12,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Checkbox(
          value: isChecked,
          onChanged: (value) => setState(() {
            isChecked = value ?? false;
          }),
        ),
      ),
    );
  }
}
