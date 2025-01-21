import 'package:flutter/material.dart';
import 'package:harmoni/features/my_profile/presentation/page/gender_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/name_setting_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/sign_up_page.dart';
import 'package:harmoni/features/my_profile/presentation/page/init_page.dart';

import 'features/my_profile/presentation/page/sign_in_page.dart';

void main() => runApp(const Harmoni());

class Harmoni extends StatelessWidget {
  const Harmoni({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: GenderPage(),
    );
  }
}
