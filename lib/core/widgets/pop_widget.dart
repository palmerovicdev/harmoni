import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopWidget extends StatelessWidget {
  const PopWidget({super.key, this.shouldAddPadding = true});

  final bool shouldAddPadding;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: shouldAddPadding ? EdgeInsets.only(left: screenWidth * 0.05) : EdgeInsets.zero,
      child: SizedBox(
        width: screenWidth * 0.1,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }
}
