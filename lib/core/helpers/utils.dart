import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harmoni/core/helpers/logger.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

import '../../generated/assets.dart';

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

enum EmotionType {
  angry,
  fearful,
  happy,
  sad,
  neutral,
  disgusted,
  surprised,
  other;

  static EmotionType fromEmotionName(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'angry':
        return EmotionType.angry;
      case 'fearful':
        return EmotionType.fearful;
      case 'happy':
        return EmotionType.happy;
      case 'sad':
        return EmotionType.sad;
      case 'neutral':
        return EmotionType.neutral;
      case 'disgusted':
        return EmotionType.disgusted;
      case 'surprised':
        return EmotionType.surprised;
      default:
        return EmotionType.other;
    }
  }
}

const emotionAssets = <EmotionType, String>{
  EmotionType.angry: Assets.circleAngryCircle,
  EmotionType.fearful: Assets.circleFearfulCircle,
  EmotionType.happy: Assets.circleHappyCircle,
  EmotionType.sad: Assets.circleSadCircle,
  EmotionType.neutral: Assets.circleNeutralCircle,
  EmotionType.disgusted: Assets.circleDisgustedCircle,
  EmotionType.surprised: Assets.circleSurpriseCircle,
  EmotionType.other: Assets.circleOtherCircle,
};

const emotionColors = <EmotionType, Color>{
  EmotionType.angry: Color(0xFFf54334),
  EmotionType.fearful: Color(0xFFC045ED),
  EmotionType.happy: Color(0xFF8CC154),
  EmotionType.sad: Color(0xFF74C9E8),
  EmotionType.neutral: Color(0xFFFFBF2C),
  EmotionType.disgusted: Color(0xFF8373BA),
  EmotionType.surprised: Color(0xFFEBD5E5),
  EmotionType.other: Color(0xFFD3E3DD),
};
