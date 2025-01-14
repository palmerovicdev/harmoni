import 'package:flutter/material.dart';

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
    return OutlinedButton.icon(
      icon: isCompleteWidget
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(image, width: 24, height: 24),
            )
          : SizedBox(),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(isCompleteWidget ? 28 : 20), side: BorderSide(color: Colors.grey)),
          alignment: Alignment.centerLeft,
          padding: !isCompleteWidget ? EdgeInsets.symmetric(vertical: 8, horizontal: 2) : null),
      onPressed: onPressed,
      iconAlignment: IconAlignment.start,
      label: isCompleteWidget
          ? Center(
              child: Text('Continue with $type'),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
              child: Image.asset(image, width: 24, height: 24),
            ),
    );
  }
}
