import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/age/age_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../router/general_routes.dart';
import '../widget/age_selection_widget.dart';

class AgePage extends StatelessWidget {
  const AgePage({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var fixedExtentScrollController = FixedExtentScrollController(initialItem: 0);
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.large.gap,
              isFromSettings
                  ? SizedBox()
                  : SizedBox(
                      width: screenWidth * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.1,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            height: 14,
                            child: const LinearProgressIndicator(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              value: 3 / 3,
                            ),
                          ),
                          Text(
                            '3 / 3',
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
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.040625),
                      child: Text(
                        'Cual es su edad?',
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Space.smaller_small.gap,
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.040625),
                      child: SizedBox(
                        width: screenWidth * 0.6,
                        child: Text(
                          'Nos gustaria saber mas acerca de usted.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Space.large.gap,
                  AgeSelectionWidget(fixedExtentScrollController: fixedExtentScrollController),
                ],
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: screenWidth * 0.85,
                child: ActionButtonWidget(
                  text: isFromSettings ? 'Guardar' : 'Continuar',
                  onPressed: () {
                    var cubit = context.read<AgeCubit>();
                    isFromSettings ? cubit.updateAge(fixedExtentScrollController.selectedItem + 12) : cubit.setAge(fixedExtentScrollController.selectedItem + 12);
                    if (state is AgeSelected) {
                      getMyProfileService().saveUserProfile();
                      isFromSettings
                          ? context.pushNamed(MyProfileRoute.allDone.data.name)
                          : context.pushNamed(MyProfileRoute.gender.data.name);
                      //TODO 2/5/25 palmerodev : add condition to check if it is an update, and save profiles in case of update, redirect to settings page
                    } else {
                      showErrorDialog(context, 'Por favor, introduzca una edad valida');
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
