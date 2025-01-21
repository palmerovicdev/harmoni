import 'package:flutter/material.dart';

import '../../../../core/widgets/spacer.dart';

class OauthAppWidget extends StatelessWidget {
  const OauthAppWidget({
    super.key,
    required this.image,
    required this.onPressed,
    this.width = 100,
    required this.type,
  });

  final String image;
  final String type;
  final Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    var isCompleteWidget = width > 80;
    return isCompleteWidget
        ? OutlinedButton.icon(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(image, width: 24, height: 24),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black12, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              alignment: Alignment.centerLeft,
            ),
            onPressed: onPressed,
            iconAlignment: IconAlignment.start,
            label: Row(
              children: [
                Space.large_w.gap,
                Text(
                  'Continue with $type',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        : IconButton(
            style: IconButton.styleFrom(
              side: BorderSide(color: Colors.black12, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            onPressed: onPressed,
            icon: SizedBox(
              width: width,
              height: width - 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(image),
                ),
              ),
            ),
          );
  }
}
