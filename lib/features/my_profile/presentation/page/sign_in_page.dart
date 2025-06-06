import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/sign_in/sign_in_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/already_have_account_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/email_input_field_widget.dart';
import 'package:harmoni/router/general_routes.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/widgets/loading_screen.dart';
import '../../../../core/widgets/spacer.dart';
import '../../service/my_profile_service.dart';
import '../widget/action_button_widget.dart';
import '../widget/password_input_field_widget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final GlobalKey _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    var width = 24.0;
    var passwordEditingController = TextEditingController();
    var emailEditingController = TextEditingController();
    var myProfileService = getMyProfileService();
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        final RenderBox? renderBox = _appBarKey.currentContext?.findRenderObject() as RenderBox?;
        final double appBarHeight = renderBox?.size.height ?? 75;
        if (state is SignInInProgress) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: LoadingWidget(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            key: _appBarKey,
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height - appBarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.small.gap,
                  Padding(
                    padding: EdgeInsets.only(left: width),
                    child: Text(
                      'Hola otra vez! 👋',
                      style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Space.smaller_small.gap,
                  Padding(
                    padding: EdgeInsets.only(left: width),
                    child: SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        'Siga dando seguimiento a sus emociones.',
                        style: textTheme.bodyLarge?.copyWith(
                          color: isDark(context) ? Colors.white54 : Colors.black54,
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
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
                      'Contraseña',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Space.smaller_small.gap,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width),
                    child: PasswordInputFieldWidget(controller: passwordEditingController),
                  ),
                  Space.medium.gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.82,
                        child: Divider(
                          thickness: 1,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Space.medium.gap,
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: screenWidth,
                    child: AlreadyHaveAccountOrNotWidget(
                      isSignUp: false,
                    ),
                  ),
                  Space.medium.gap,
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width),
                      child: SizedBox(
                        width: double.infinity,
                        child: ActionButtonWidget(
                          text: "Autenticarse",
                          shouldFocusAttention: true,
                          onPressed: () async {
                            context.read<SignInCubit>().initSignIn();
                            var validationResult = await myProfileService.validateEmail(emailEditingController.text);
                            if (validationResult != EmailValidationResult.repeated.name) {
                              showErrorDialog(
                                  context.mounted ? context : context,
                                  'Por favor, introduzca un email válido.${validationResult == EmailValidationResult.invalid.name ? ' '
                                      'La dirección de correo electrónico no es válida.' : 'No hay ningún usuario registrado con ese email'}');
                              if (context.mounted) {
                                context.read<SignInCubit>().signInError('Por favor, introduzca un email válido.${validationResult == EmailValidationResult.invalid.name ? ' '
                                    'La dirección de correo electrónico no es válida.' : 'No hay ningún usuario registrado con ese email'}');
                              }
                              return;
                            }
                            if (context.mounted) {
                              var result = await context.read<SignInCubit>().signIn(emailEditingController.text, passwordEditingController.text);
                              if (!result) {
                                showErrorDialog(context.mounted ? context : context, 'Por favor, introduzca un email y una contraseña válidos.');
                                if (context.mounted) context.read<SignInCubit>().signInError('Por favor, introduzca un email y una contraseña válidos.');
                                return;
                              }
                              if (context.mounted) {
                                context.pushNamed(HomeRoute.home.data.name);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Space.large.gap,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
