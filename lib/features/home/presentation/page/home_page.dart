import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/general_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
            IconButton(
              onPressed: () {
                context.pushNamed(MyProfileRoute.init.data.name);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
