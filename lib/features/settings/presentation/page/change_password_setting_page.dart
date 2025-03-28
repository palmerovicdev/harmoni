import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/password_input_field_widget.dart';

import '../../../../core/widgets/spacer.dart';
import '../state_management/change_password_setting/password_change_setting_cubit.dart';

class ChangePasswordSettingPage extends StatelessWidget {
  const ChangePasswordSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500);
    var actualPasswordController = TextEditingController();
    var newPasswordController = TextEditingController();
    var newRepeatedPasswordController = TextEditingController();
    var color = Theme.of(context).colorScheme.primary;

    return BlocBuilder<ChangePasswordSettingCubit, ChangePasswordSettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Cambiar contraseña'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.small.gap,
                  Center(
                    child: Icon(
                      Icons.admin_panel_settings_sharp,
                      size: 160,
                      color: color,
                    ),
                  ),
                  Space.medium.gap,
                  Text(
                    'Contraseña actual',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(
                    controller: actualPasswordController,
                  ),
                  Space.small.gap,
                  Text(
                    'Contraseña nueva',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(
                    controller: newPasswordController,
                  ),
                  Space.small.gap,
                  Text(
                    'Contraseña nueva repetida',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  PasswordInputFieldWidget(
                    controller: newRepeatedPasswordController,
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
