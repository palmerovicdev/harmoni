import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoodTrackWidget extends StatelessWidget {
  const MoodTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      '',
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(
                thickness: 1.0,
              ),
            ),
            Wrap(
              children: [],
            ),
            //TODO: aqui va el reproductor de audio
            Wrap(
              children: [],
            ),
          ],
        ),
      ),
      duration: Duration(milliseconds: 150),
    );
  }
}
