import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/utils.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/core/widgets/spacer.dart';
import 'package:harmoni/features/settings/presentation/state_management/security_setting/security_setting_cubit.dart';
import 'package:harmoni/features/settings/presentation/widget/setting_action_widget.dart';

import '../../../../core/helpers/settings_enums.dart';
import '../../../../router/general_routes.dart';

class SecuritySettingPage extends StatelessWidget {
  const SecuritySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    return BlocBuilder<SecuritySettingCubit, SecuritySettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Seguridad'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Space.small.gap,
                Center(
                  child: Icon(
                    Icons.security_outlined,
                    size: 140,
                    color: color,
                  ),
                ),
                Space.medium.gap,
                SettingActionWidget(
                  title: 'Cambiar contraseña',
                  color: color,
                  leading: Icon(
                    Icons.password_outlined,
                    size: 32,
                    color: color,
                  ),
                  onPressed: () {
                    context.pushNamed(MyProfileRoute.change_password.name);
                  },
                ),
                Space.small.gap,
                SettingActionWidget(
                  title: 'Borrar cuenta',
                  color: Colors.red.withOpacity(0.8),
                  leading: Icon(
                    Icons.delete_rounded,
                    size: 32,
                    color: Colors.red.withOpacity(0.8),
                  ),
                  onPressed: () async {
                    var response = false;
                    await showConditionalDialog(
                      context,
                      'Estas seguro de querer borrar tu cuenta?',
                      onAcceptPressed: () => response = true,
                      dialogSettingOptionName: SettingsEnums.shouldShowDeleteAccountPopDialog.name,
                      shouldShowCheckBox: false,
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                    );
                    if (!response) return;
                    getMyProfileService().userProfile = null;
                    if (context.mounted) context.goNamed(HomeRoute.home.data.name);
                  },
                  action: Icon(
                    Icons.logout_rounded,
                    size: 32,
                    color: Colors.red.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
