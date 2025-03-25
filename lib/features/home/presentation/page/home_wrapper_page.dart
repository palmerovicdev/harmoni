import 'package:flutter/material.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';

import '../../../../core/widgets/navigation_menu.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = getHomeService().currentLocationIndex;
    return Scaffold(
      bottomNavigationBar: NavigationMenu(selectedIndex: _selectedIndex),
      body: child,
    );
  }
}
