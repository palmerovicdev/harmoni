import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harmoni/core/helpers/logger.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

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
  String? dialogSettingOptionName,
  EdgeInsets? padding,
  bool shouldShowCheckBox = true,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      var screenWidth = MediaQuery.sizeOf(context).width;
      var colorWithOpacity = Theme.of(context).colorScheme.primary.withOpacity(0.05);
      var shouldShowAgain = true;
      return AlertDialog(
        title: Text(message),
        insetPadding: padding ?? EdgeInsets.all(2),
        actionsPadding: EdgeInsets.only(bottom: 12, right: 16),
        content: shouldShowCheckBox
            ? SizedBox(
                height: 40,
                child: Row(
                  children: [
                    CheckBoxWidget(
                      screenWidth: screenWidth,
                      callBack: (value) {
                        logI('$value');
                        shouldShowAgain = !value;
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'No mostrar otra vez',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        actions: [
          TextButton(
            style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(colorWithOpacity),
                surfaceTintColor: WidgetStatePropertyAll(colorWithOpacity),
                backgroundColor: WidgetStatePropertyAll(colorWithOpacity),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(8),
                ))),
            onPressed: () {
              getMyProfileService().userProfile?.settings?.update(
                    dialogSettingOptionName ?? SettingsEnums.shouldShowLogOutDialog.name,
                    (value) => value = shouldShowAgain,
                    ifAbsent: () => shouldShowAgain,
                  );
              logI('Saving user profile in pop: ${jsonEncode(getMyProfileService().userProfile)}');
              getMyProfileService().saveSettings(getMyProfileService().userProfile?.settings ?? {});
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              getMyProfileService().userProfile?.settings?.update(
                    dialogSettingOptionName ?? SettingsEnums.shouldShowLogOutDialog.name,
                    (value) => value = shouldShowAgain,
                    ifAbsent: () => shouldShowAgain,
                  );
              logI('Saving user profile in pop: ${jsonEncode(getMyProfileService().userProfile)}');
              getMyProfileService().saveSettings(getMyProfileService().userProfile?.settings ?? {});
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
    required this.callBack,
  });

  final double screenWidth;
  final Function(bool value) callBack;

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
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
            logI('$isChecked');
            widget.callBack.call(isChecked);
          },
        ),
      ),
    );
  }
}

isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
