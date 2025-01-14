import 'package:flutter/material.dart';

class Spacer extends StatelessWidget {
  const Spacer({
    super.key,
    this.heightPercent = 0,
    this.widthPercent = 0,
  }) : assert((heightPercent == 0 && widthPercent != 0) || (heightPercent != 0 && widthPercent == 0), 'at less one of widPercent or height percent must not be null');

  final double heightPercent;
  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * heightPercent,
      width: screenWidth * widthPercent,
    );
  }
}

enum Space {
  smaller_small(Spacer(
    heightPercent: 0.01015625,
  )),
  small(Spacer(
    heightPercent: 0.0203125,
  )),
  medium(Spacer(
    heightPercent: 0.040625,
  )),
  large(Spacer(
    heightPercent: 0.08125,
  )),
  extra_large(Spacer(
    heightPercent: 0.1625,
  )),
  smaller_small_w(Spacer(
    widthPercent: 0.01015625,
  )),
  small_w(Spacer(
    widthPercent: 0.0203125,
  )),
  medium_w(Spacer(
    widthPercent: 0.040625,
  )),
  large_w(Spacer(
    widthPercent: 0.08125,
  )),
  extra_large_w(Spacer(
    widthPercent: 0.1625,
  ));

  final Spacer gap;

  const Space(this.gap);
}
