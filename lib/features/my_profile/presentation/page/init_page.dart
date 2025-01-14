import 'package:flutter/material.dart';
import 'package:harmoni/assets.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/oauth_app_widget.dart';

import '../../../../core/widgets/spacer.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Space.large.grap,
            Image.asset(
              Assets.InitPageImage96,
              width: 58,
              height: 58,
            ),
            Space.large.grap,
            Text(
              'Let\'s Get Started!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Space.small.grap,
            SizedBox(
              width: screenWidth * 0.6,
              child: Text(
                'Welcome to the Harmoni app, let\'s drive into your account',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Space.medium.grap,
            SizedBox(
              width: screenWidth * 0.85,
              child: OauthAppWidget(
                image: Assets.InitPageImage,
                onPressed: () {},
                type: 'Google',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.small.grap,
            SizedBox(
              width: screenWidth * 0.85,
              child: OauthAppWidget(
                image: Assets.InitPageImage,
                onPressed: () {},
                type: 'GitHub',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.extra_large.grap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Sign Up",
                shouldFocusAttention: true,
                onPressed: () {},
              ),
            ),
            Space.small.grap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Log In",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
