import 'package:flutter/material.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';

import '../../../../core/widgets/spacer.dart';
import '../widget/age_selection_widget.dart';

class AgePage extends StatelessWidget {
  const AgePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var fixedExtentScrollController = FixedExtentScrollController(initialItem: 0);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.large.gap,
          SizedBox(
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
                    'How old are you?',
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
                      'We\'d like to know more about you.',
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
              text: 'Continue',
              onPressed: () {},
              shouldFocusAttention: true,
            ),
          ),
          Space.large.gap,
        ],
      ),
    );
  }
}
