import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/utils.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/password_input_field_widget.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/widgets/spacer.dart';
import '../state_management/change_password_setting/password_change_setting_cubit.dart';

class ChangePasswordSettingPage extends StatelessWidget {
  const ChangePasswordSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var fontStyle = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400);
    var actualPasswordController = TextEditingController();
    var newPasswordController = TextEditingController();
    var newRepeatedPasswordController = TextEditingController();
    var color = Theme.of(context).colorScheme.primary;

    return BlocBuilder<ChangePasswordSettingCubit, ChangePasswordSettingState>(
      builder: (context, state) {
        var isValid = state is ChangePasswordSettingInitial;
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Cambiar contraseña'),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton(
              onPressed: () {
                if (newPasswordController.text.isEmpty || actualPasswordController.text.isEmpty) {
                  showErrorDialog(context, 'Contraseña incorrecta. Las contraseñas no deben estar vacías. Reintenta.');
                  return;
                }
                if (!getMyProfileService().matchPassword(actualPasswordController.text, getMyProfileService().userProfile?.password ?? '')) {
                  showErrorDialog(context, 'La contraseña es incorrecta. Reintenta.');
                  return;
                }
                if (state is! ChangePasswordSettingInitial) {
                  showErrorDialog(context, 'Contraseña incorrecta. Las contraseñas no coinciden. Reintenta.');
                  return;
                }
                if (newPasswordController.text.length <= 8) {
                  showErrorDialog(context, 'Contraseña incorrecta. Las contraseñas deben tener al menos 8 caracteres. Reintenta.');
                  return;
                }

                getMyProfileService().userProfile?.password = getMyProfileService().hashPassword(newRepeatedPasswordController.text);
                getMyProfileService().saveUserProfile();
                actualPasswordController = TextEditingController();
                newPasswordController = TextEditingController();
                newRepeatedPasswordController = TextEditingController();
                context.goNamed(MyProfileRoute.my_profile.data.name);
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainerHigh),
              ),
              child: Text('Aceptar', style: textTheme.bodyLarge),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.small.gap,
                  Center(
                    child: Icon(Icons.admin_panel_settings_sharp, size: 160, color: color),
                  ),
                  Space.medium.gap,
                  Text('Contraseña actual', style: fontStyle),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(controller: actualPasswordController),
                  Space.small.gap,
                  Text('Contraseña nueva', style: fontStyle),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(
                    controller: newPasswordController,
                    shouldValidate: false,
                    validatePassword: () => context.read<ChangePasswordSettingCubit>().validatePassword(newPasswordController.text == newRepeatedPasswordController.text),
                    isValidByDefault: isValid,
                  ),
                  Space.small.gap,
                  Text('Contraseña nueva repetida', style: fontStyle),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(
                    controller: newRepeatedPasswordController,
                    shouldValidate: false,
                    validatePassword: () => context.read<ChangePasswordSettingCubit>().validatePassword(newPasswordController.text == newRepeatedPasswordController.text),
                    isValidByDefault: isValid,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
