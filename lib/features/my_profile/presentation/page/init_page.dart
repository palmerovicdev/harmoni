import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/assets.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/oauth_app_widget.dart';

import '../../../../core/widgets/spacer.dart';
import '../../../../router/general_routes.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Space.large.gap,
            Space.large.gap,
            Image.asset(
              Assets.InitPageImage96,
              width: 58,
              height: 58,
            ),
            Space.medium.gap,
            Space.small.gap,
            Text(
              'Comencemos!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Space.small.gap,
            SizedBox(
              width: screenWidth * 0.6,
              child: Text(
                'Bienvenido a Harmoni, comencemos a configurar su cuenta',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Space.large.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: OauthAppWidget(
                image: Assets.InitPageImage,
                onPressed: () {}, //TODO 1/27/25 palmerodev : add Google OAuth logic
                type: 'Google',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.small.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: OauthAppWidget(
                image: Assets.InitPageImage,
                onPressed: () {}, //TODO 1/27/25 palmerodev : add GitHub OAuth logic
                type: 'GitHub',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.extra_large.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Sign Up",
                shouldFocusAttention: true,
                onPressed: () => context.pushNamed(MyProfileRoute.signUp.data.name),
              ),
            ),
            Space.small.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Log In",
                onPressed: () => context.pushNamed(MyProfileRoute.signIn.data.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
