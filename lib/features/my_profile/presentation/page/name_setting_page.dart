import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/helpers/utils.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/name_setting/name_setting_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/name_input_field_widget.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/widgets/spacer.dart';
import '../../service/my_profile_service.dart';

class NameSettingPage extends StatelessWidget {
  const NameSettingPage({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var nameController = TextEditingController();
    return BlocBuilder<NameSettingCubit, NameSettingState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Space.large.gap,
              isFromSettings
                  ? SizedBox()
                  : SizedBox(
                      width: screenWidth * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PopWidget(
                            shouldAddPadding: false,
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            height: 14,
                            child: const LinearProgressIndicator(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              value: 1 / 3,
                            ),
                          ),
                          Text(
                            '1 / 3',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.medium.gap,
                  Center(
                    child: Text(
                      'Como deberíamos llamarlo?',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Space.small.gap,
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        'Primero lo primero, introduzca su nombre.',
                        style: textTheme.bodyLarge?.copyWith(
                          color: isDark(context) ? Colors.white54 : Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Space.small.gap,
                  Space.small.gap,
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: NameInputFieldWidget(controller: nameController),
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: screenWidth * 0.80,
                child: ActionButtonWidget(
                  text: isFromSettings ? 'Guardar' : 'Continuar',
                  onPressed: () async {
                    var cubit = context.read<NameSettingCubit>();
                    var result = await cubit.validateName(nameController.text);
                    if (result != NameValidationResult.success.name && context.mounted) {
                      showErrorDialog(
                          context,
                          'Por favor, introduzca un nombre valido.${result == NameValidationResult.repeated.name ? ' Este nombre ya ha sido registrado antes'
                              '.' : 'El nombre no es válido.'}');
                      return;
                    }
                    var response = isFromSettings ? await cubit.updateName(nameController.text) : await cubit.setName(nameController.text);
                    if (response && context.mounted) {
                      isFromSettings ? context.pushNamed(MyProfileRoute.allDone.data.name, extra: true) : context.pushNamed(MyProfileRoute.gender.name, extra: false);
                    }
                  },
                  shouldFocusAttention: true,
                ),
              ),
              Space.large.gap,
            ],
          ),
        );
      },
    );
  }
}
