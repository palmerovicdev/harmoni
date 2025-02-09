import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/assets.dart';

import '../../../../core/widgets/spacer.dart';
import '../../../../router/general_routes.dart';
import '../widget/action_button_widget.dart';

class AllDonePage extends StatelessWidget {
  const AllDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.AllDoneImage96,
              width: 58,
              height: 58,
            ),
            Space.medium.gap,
            Text(
              '¡Todo listo!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox()),
            Center(
              child: SizedBox(
                width: screenWidth * 0.85,
                child: ActionButtonWidget(
                  text: "Ir a Inicio",
                  shouldFocusAttention: true,
                  onPressed: () => {
                    context.pushNamed(HomeRoute.home.data.name),
                  },
                ),
              ),
            ),
            Space.large.gap,
          ],
        ),
      ),
    );
  }
}
