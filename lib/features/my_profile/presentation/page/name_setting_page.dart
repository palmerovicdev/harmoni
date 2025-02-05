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

class NameSettingPage extends StatelessWidget {
  const NameSettingPage({super.key});

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
              SizedBox(
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
                      'What should we call you?',
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
                        'First things first, enter your nickname.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
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
                  text: 'Continue',
                  onPressed: () {
                    context.read<NameSettingCubit>().setName(nameController.text);
                    if (state is NameSettingValid) {
                      context.pushNamed(MyProfileRoute.gender.name);
                    } else {
                      showErrorDialog(context, 'Please, enter a valid name');
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
