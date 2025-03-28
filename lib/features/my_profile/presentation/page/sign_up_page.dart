import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoni/core/widgets/loading_screen.dart';
import 'package:harmoni/features/my_profile/presentation/state_management/sign_up/sign_up_cubit.dart';
import 'package:harmoni/features/my_profile/presentation/widget/already_have_account_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/email_input_field_widget.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/pop_widget.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../router/general_routes.dart';
import '../../service/my_profile_service.dart';
import '../widget/action_button_widget.dart';
import '../widget/password_input_field_widget.dart';
import '../widget/terms_and_condition_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    var width = 24.0;
    var hasReadTermsAndConditions = false;
    var passwordEditingController = TextEditingController();
    var emailEditingController = TextEditingController();
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        if (state is SignUpInProgress) {
          return LoadingWidget();
        }
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
                  'Unase a Harmoni hoy ✨',
                  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Space.smaller_small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: SizedBox(
                  width: screenWidth * 0.6,
                  child: Text(
                    'Comience a dar seguimiento a sus emociones.',
                    style: textTheme.bodyMedium?.copyWith(
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
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Space.smaller_small.gap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width),
                child: EmailInputFieldWidget(
                  controller: emailEditingController,
                ),
              ),
              Space.small.gap,
              Padding(
                padding: EdgeInsets.only(left: width),
                child: Text(
                  'Contraseña',
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
                child: TermsAndConditionWidget(onChanged: (value) => hasReadTermsAndConditions = value),
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
                  isSignUp: true,
                ),
              ),
              Space.medium.gap,
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width),
                  child: SizedBox(
                    width: double.infinity,
                    child: ActionButtonWidget(
                      text: "Crear Cuenta",
                      shouldFocusAttention: true,
                      onPressed: () async {
                        var validationResult = await context.read<SignUpCubit>().validateEmail(emailEditingController.text);
                        if (validationResult != EmailValidationResult.success.name) {
                          showErrorDialog(
                              context.mounted ? context : context,
                              'Por favor, introduzca un email valido.${validationResult == EmailValidationResult.repeated.name ? ' '
                                  'Este email ya ha sido registrado antes.' : 'La dirección de correo electrónico no es válida.'}');
                          return;
                        }
                        var isValidPassword = context.mounted ? context.read<SignUpCubit>().validatePassword(passwordEditingController.text) : 'success';
                        if (isValidPassword != PasswordValidationResult.success.name) {
                          showErrorDialog(
                            context.mounted ? context : context,
                            'Por favor, introduzca una contraseña valida.${isValidPassword == 'tooShort' ? ' La contraseña '
                                'debe tener al menos 6 caracteres.' : isValidPassword == 'tooLong' ? ' La contraseña debe tener menos de 16 caracteres.' : ''}',
                          );
                          return;
                        }
                        if (!hasReadTermsAndConditions) {
                          showErrorDialog(context.mounted ? context : context, 'Por favor, lea y acepte los términos y condiciones antes de continuar');
                          return;
                        }
                        var isSuccessSignUp = context.mounted ? context.read<SignUpCubit>().signUp(emailEditingController.text, passwordEditingController.text) : false;
                        if (!isSuccessSignUp) {
                          showErrorDialog(context.mounted ? context : context, 'Ha ocurrido un error al crear su cuenta. Por favor, inténtelo de nuevo más tarde.');
                          return;
                        }
                        if (context.mounted) context.push(MyProfileRoute.name.data.path, extra: false);
                      },
                    ),
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
