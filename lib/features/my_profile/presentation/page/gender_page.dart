import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/gender_selection/gender_selection_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/gender_selection_widget.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/spacer.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<GenderSelectionCubit, GenderSelectionState>(
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
                        value: 2 / 3,
                      ),
                    ),
                    Text(
                      '2 / 3',
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
                      'Cual es su género?',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Space.smaller_small.gap,
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        'Ayúdenos a mejorar su experiencia.',
                        style: textTheme.bodyLarge?.copyWith(
                          color: isDark(context) ? Colors.white54 : Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Space.large.gap,
                  Space.large.gap,
                  GenderSelectionWidget(
                    onMGenderSelected: (gender) {
                      context.read<GenderSelectionCubit>().setGender(gender);
                    },
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: screenWidth * 0.8,
                child: ActionButtonWidget(
                  text: 'Continuar',
                  onPressed: () {
                    if (state is GenderSelected) {
                      var cubit = context.read<GenderSelectionCubit>();
                      cubit.updateGender(state.gender);
                      isFromSettings ? context.pushNamed(MyProfileRoute.allDone.data.name, extra: true) : context.pushNamed(MyProfileRoute.age.name, extra: false);
                    } else {
                      showErrorDialog(context, 'Por favor, elija su género');
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
