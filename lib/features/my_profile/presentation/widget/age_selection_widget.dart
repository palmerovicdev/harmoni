import 'package:flutter/material.dart';

import '../../../../core/widgets/spacer.dart';

class AgeSelectionWidget extends StatefulWidget {
  const AgeSelectionWidget({super.key, this.fixedExtentScrollController});

  final FixedExtentScrollController? fixedExtentScrollController;

  @override
  State<AgeSelectionWidget> createState() => _AgeSelectionWidgetState();
}

class _AgeSelectionWidgetState extends State<AgeSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Divider(
                thickness: 2,
                color: colorScheme.primary,
              ),
            ),
            Space.medium.gap,
            Space.smaller_small.gap,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Divider(
                thickness: 2,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: ListWheelScrollView.useDelegate(
            perspective: 0.01,
            diameterRatio: 3,
            overAndUnderCenterOpacity: 0.8,
            physics: const FixedExtentScrollPhysics(),
            itemExtent: 68,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 68,
              builder: (context, index) {
                return Center(
                  child: Text(
                    key: ValueKey(index),
                    '${index + 12}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
