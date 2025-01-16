import 'package:flutter/material.dart';

class GenderSelectionWidget extends StatefulWidget {
  const GenderSelectionWidget({super.key});

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 132,
            width: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
          )
        ],
      ),
    );
  }
}
