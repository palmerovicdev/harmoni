import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/navigation_menu.dart';
import 'package:harmoni/core/widgets/spacer.dart';

import '../../../../assets.dart';
import '../../../../router/general_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationMenu(selectedIndex: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Space.large.gap,
          Row(
            children: [
              Space.medium_w.gap,
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                  Assets.CloudSnow,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'Home',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                  Assets.ProfileChecked,
                ),
              ),
              Space.medium_w.gap,
            ],
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(MyProfileRoute.init.data.name);
            },
            icon: Icon(Icons.add),
          ),
          Space.medium.gap,
        ],
      ),
    );
  }
}
