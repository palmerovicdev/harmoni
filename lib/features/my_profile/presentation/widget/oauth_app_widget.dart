import 'package:flutter/material.dart';

class OauthAppWidget extends StatelessWidget {
  const OauthAppWidget({super.key, required this.image, required this.onPressed, this.width = 100, required this.type});

  final String image;
  final String type;
  final Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: width > 200
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(image),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Continue with $type')),
                  ],
                ),
              ],
            )
          : Center(child: Image.asset(image)),
    );
  }
}
