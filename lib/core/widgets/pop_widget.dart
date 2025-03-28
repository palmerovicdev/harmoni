import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/helpers/utils.dart';

class PopWidget extends StatelessWidget {
  const PopWidget({
    super.key,
    this.shouldAddPadding = true,
    this.shouldShowDialog,
  });

  final bool shouldAddPadding;
  final bool? shouldShowDialog;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: shouldAddPadding ? EdgeInsets.only(left: screenWidth * 0.05) : EdgeInsets.zero,
      child: SizedBox(
        width: screenWidth * 0.1,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: IconButton(
            onPressed: () {
              bool value = true;
              if (shouldShowDialog ?? false) {
                value = false;
                showConditionalDialog(
                  context,
                  'Estas seguro de que quieres salir?',
                  onAcceptPressed: () => value = true,
                  dialogSettingOptionName: SettingsEnums.shouldShowAccountPopDialog.name,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                );
              }
              if (value) context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }
}
