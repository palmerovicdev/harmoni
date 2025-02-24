import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            SvgPicture.asset(
              Assets.CloudSnow,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              width: 96,
              height: 96,
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
                image: Assets.Google,
                onPressed: () {}, //TODO 1/27/25 palmerodev : add Google OAuth logic
                type: 'Google',
                colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.srcIn),
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.small.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: OauthAppWidget(
                image: Assets.Github,
                onPressed: () {}, //TODO 1/27/25 palmerodev : add GitHub OAuth logic
                type: 'GitHub',
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            Space.large.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Crear Cuenta",
                shouldFocusAttention: true,
                onPressed: () => context.pushNamed(MyProfileRoute.signUp.data.name),
              ),
            ),
            Space.small.gap,
            SizedBox(
              width: screenWidth * 0.85,
              child: ActionButtonWidget(
                text: "Autenticarse",
                onPressed: () => context.pushNamed(MyProfileRoute.signIn.data.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
