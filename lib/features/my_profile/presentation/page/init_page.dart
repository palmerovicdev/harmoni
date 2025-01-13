import 'package:flutter/material.dart';
import 'package:harmoni/assets.dart';
import 'package:harmoni/features/my_profile/presentation/widget/oauth_app_widget.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.InitPageImage96),
          const SizedBox(height: 20),
          Text(
            'Let\'s Get Started!' ,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to the Harmoni app, let\'s drive into your account',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          OauthAppWidget(image: Assets.InitPageImage, onPressed: (){}, type: 'Google')
        ],
      ),
    );
  }
}
