import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/settings/presentation/state_management/account_setting/account_setting_cubit.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSettingCubit, AccountSettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Informacion Personal'),
          ),
          body: Column(

          ),
        );
      },
    );
  }
}
