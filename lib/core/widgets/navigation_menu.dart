import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../assets.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        context.push(navigationLocations[value]['destination'] ?? '/home');
      },
      destinations: navigationLocations
          .map(
            (e) => NavigationDestination(
              icon: SvgPicture.asset(e['icon'] ?? ''),
              label: e['name'] ?? '',
              selectedIcon: SvgPicture.asset(e['iconActive'] ?? ''),
            ),
          )
          .toList(),
    );
  }
}

var navigationLocations = [
  {"name": "Inicio", "icon": Assets.HomeUnchecked, "iconActive": Assets.HomeChecked, "destination": HomeRoute.home.data.name},
  {"name": "Mediciones", "icon": Assets.ChartUnchecked, "iconActive": Assets.ChartChecked, "destination": "location of insights"},
  {"name": "Calendario", "icon": Assets.CalendarUnchecked, "iconActive": Assets.CalendarChecked, "destination": "location of calendar"},
  {"name": "Perfil", "icon": Assets.ProfileUnchecked, "iconActive": Assets.ProfileChecked, "destination": "location of my profile"}
];
