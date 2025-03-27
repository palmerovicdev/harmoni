import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../generated/assets.dart';
import '../service_locator/service_locator.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: selectedIndex,
      indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      overlayColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary.withOpacity(0.1)),
      onDestinationSelected: (value) {
        getHomeService().currentLocationIndex = value;
        context.goNamed(navigationLocations[value]['destination'] ?? '/home');
      },
      destinations: navigationLocations
          .map(
            (e) => NavigationDestination(
              icon: SvgPicture.asset(
                e['icon'] ?? '',
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                height: 28,
              ),
              label: e['name'] ?? '',
              selectedIcon: SvgPicture.asset(
                e['iconActive'] ?? '',
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryFixed, BlendMode.srcIn),
                height: 26,
              ),
            ),
          )
          .toList(),
    );
  }
}

var navigationLocations = [
  {"name": "Inicio", "icon": Assets.coreHomeUnchecked, "iconActive": Assets.coreHomeChecked, "destination": HomeRoute.home.data.name},
  {"name": "Mediciones", "icon": Assets.coreChartUnchecked, "iconActive": Assets.coreChartChecked, "destination": null},
  {"name": "Calendario", "icon": Assets.coreCalendarUnchecked, "iconActive": Assets.coreCalendarChecked, "destination": null},
  {"name": "Perfil", "icon": Assets.coreProfileUnchecked, "iconActive": Assets.coreProfileChecked, "destination": MyProfileRoute.my_profile.data.name}
];
