import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/gender_selection_widget.dart';
import 'package:harmoni/features/my_profile/service/my_profile_service.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/widgets/spacer.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var width = screenWidth * 0.08125;
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
                  'What is your gender?',
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
                    'Help us tailor your experience.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Space.large.gap,
              Space.large.gap,
              GenderSelectionWidget()
            ],
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            width: screenWidth * 0.8,
            child: ActionButtonWidget(
              text: 'Continue',
              onPressed: () => context.pushNamed(MyProfileRoute.age.name),
              shouldFocusAttention: true,
            ),
          ),
          Space.large.gap,
        ],
      ),
    );
  }
}
