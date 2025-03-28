import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/features/my_profile/presentation/widget/action_button_widget.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../generated/assets.dart';
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
              Assets.coreCloudSnow,
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
                  color: isDark(context) ? Colors.white54 : Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Space.large.gap,
            Expanded(child: SizedBox()),
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
            ),
            Space.large.gap,
          ],
        ),
      ),
    );
  }
}
