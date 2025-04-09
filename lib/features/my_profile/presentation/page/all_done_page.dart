import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/spacer.dart';
import '../../../../generated/assets.dart';
import '../../../../router/general_routes.dart';
import '../widget/action_button_widget.dart';

class AllDonePage extends StatelessWidget {
  const AllDonePage({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesAllDoneImage96,
              width: 58,
              height: 58,
            ),
            Space.medium.gap,
            Text(
              isFromSettings ? 'Su cambio ha sido realizado con éxito!' : '¡Todo listo!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox()),
            Center(
              child: SizedBox(
                width: screenWidth * 0.85,
                child: ActionButtonWidget(
                  text: isFromSettings ? 'Volver a settings' : 'Ir a Inicio',
                  shouldFocusAttention: true,
                  onPressed: () => {
                    isFromSettings ? context.pushNamed(HomeRoute.home.data.name) : context.pushNamed(HomeRoute.home.data.name), //TODO 2/9/25 palmerodev : cambiar ruta a settings
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
