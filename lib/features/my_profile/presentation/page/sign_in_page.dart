import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/sign_in/sign_in_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/already_have_account_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/email_input_field_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/oauth_app_widget.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../assets.dart';
import '../../../../core/widgets/spacer.dart';
import '../widget/action_button_widget.dart';
import '../widget/password_input_field_widget.dart';
import '../widget/terms_and_condition_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    var width = screenWidth * 0.08125;
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        var passwordEditingController = TextEditingController();
        var emailEditingController = TextEditingController();
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.large.gap,
              PopWidget(),
              Space.small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: Text(
                  'Wellcome Back! 👋',
                  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Space.smaller_small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: SizedBox(
                  width: screenWidth * 0.6,
                  child: Text(
                    'Continue tracking your moods.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Space.small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: Text(
                  'Email',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Space.smaller_small.gap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width),
                child: EmailInputFieldWidget(controller: emailEditingController),
              ),
              Space.small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: Text(
                  'Password',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Space.smaller_small.gap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width),
                child: PasswordInputFieldWidget(controller: passwordEditingController),
              ),
              Space.small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: TermsAndConditionWidget(),
              ),
              Space.medium.gap,
              SizedBox(
                width: screenWidth,
                child: AlreadyHaveAccountOrNotWidget(
                  isSignUp: false,
                ),
              ),
              Space.medium.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.22,
                    child: Divider(
                      thickness: 1,
                      color: colorScheme.primary,
                    ),
                  ),
                  Space.small_w.gap,
                  Text(
                    'or continue with',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Space.small_w.gap,
                  SizedBox(
                    width: screenWidth * 0.22,
                    child: Divider(
                      thickness: 1,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Space.small.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OauthAppWidget(
                    image: Assets.InitPageImage,
                    onPressed: () {},
                    type: 'GitHub',
                    width: 50,
                  ),
                  Space.small_w.gap,
                  OauthAppWidget(
                    image: Assets.InitPageImage,
                    onPressed: () {},
                    type: 'Google',
                    width: 50,
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.85,
                  child: ActionButtonWidget(
                    text: "Sign In",
                    shouldFocusAttention: true,
                    onPressed: () => { //TODO 2/5/25 palmerodev : change to execute logic for fetching all user profile data and redirect to home page
                      context.read<SignInCubit>().signIn(emailEditingController.text, passwordEditingController.text),
                      context.pushNamed(MyProfileRoute.name.name),
                    },
                  ),
                ),
              ),
              Space.large.gap,
            ],
          ),
        );
      },
    );
  }
}
