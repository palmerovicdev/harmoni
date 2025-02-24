import 'package:flutter/material.dart';

import '../../../../core/widgets/spacer.dart';

class GenderSelectionWidget extends StatefulWidget {
  const GenderSelectionWidget({super.key, this.onMGenderSelected});

  final Function(String gender)? onMGenderSelected;

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  var maleSelected = false;
  var femaleSelected = false;
  var otherSelected = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      maleSelected = true;
                      femaleSelected = false;
                      otherSelected = false;
                    });
                    widget.onMGenderSelected?.call(Gender.male.name);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.male,
                      size: 72,
                      color: maleSelected ? colorScheme.onPrimary : null,
                    ),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: maleSelected ? colorScheme.primary : null,
                    side: BorderSide(color: Colors.black12, width: 1),
                  ),
                ),
                Space.small.gap,
                Text(
                  'Male',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: maleSelected ? colorScheme.primary : null,
                  ),
                ),
              ],
            ),
            Space.large_w.gap,
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      maleSelected = false;
                      femaleSelected = true;
                      otherSelected = false;
                    });
                    widget.onMGenderSelected?.call(Gender.female.name);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.female,
                      size: 72,
                      color: femaleSelected ? colorScheme.onPrimary : null,
                    ),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: femaleSelected ? colorScheme.primary : null,
                    side: BorderSide(color: Colors.black12, width: 1),
                  ),
                ),
                Space.small.gap,
                Text(
                  'Female',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: femaleSelected ? colorScheme.primary : null,
                  ),
                ),
              ],
            ),
          ],
        ),
        Space.medium.gap,
        TextButton(
          onPressed: () {
            setState(() {
              maleSelected = false;
              femaleSelected = false;
              otherSelected = true;
            });
            widget.onMGenderSelected?.call(Gender.other.name);
          },
          style: TextButton.styleFrom(
            backgroundColor: otherSelected ? colorScheme.primary : null,
            side: BorderSide(color: Colors.black12, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(
              'Prefer not to say',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: otherSelected ? colorScheme.onPrimary : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum Gender { male, female, other }
