import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/core/widgets/spacer.dart';
import 'package:harmoni/features/my_profile/presentation/widget/email_input_field_widget.dart';
import 'package:harmoni/features/my_profile/presentation/widget/name_input_field_widget.dart';
import 'package:harmoni/features/settings/presentation/state_management/account_setting/account_setting_cubit.dart';

import '../../../../generated/assets.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var service = getMyProfileService();
    var userProfile = service.userProfile;
    var nameController = TextEditingController(text: userProfile?.name);
    var emailController = TextEditingController(text: userProfile?.email);
    var ageController = TextEditingController(text: userProfile?.age.toString());
    var genderController = ExpansionTileController();
    return BlocBuilder<AccountSettingCubit, AccountSettingState>(
      buildWhen: (previous, current) =>
          (previous as AccountSettingInitial).hasChangedData != (current as AccountSettingInitial).hasChangedData || (previous).hasBeenPop != (current).hasBeenPop,
      builder: (context, state) {
        var color = Theme.of(context).colorScheme.primary;
        var fontStyle = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400);
        var accountSettingCubit = context.read<AccountSettingCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(
                beforePop: () {
                  getMyProfileService().profileAuxGender = '';
                  accountSettingCubit.changePopState();
                },
                shouldShowDialog: (state as AccountSettingInitial).hasChangedData && (userProfile?.settings?[SettingsEnums.shouldShowAccountPopDialog.name] as bool? ?? true),
                onPop: () async {
                  service.userProfile = await service.getUserProfileByName(userProfile?.name ?? '');
                  nameController = TextEditingController(text: userProfile?.name);
                  emailController = TextEditingController(text: userProfile?.email);
                  ageController = TextEditingController(text: userProfile?.age.toString());
                  genderController = ExpansionTileController();
                  if (context.mounted) accountSettingCubit.resetState();
                }),
            title: Text('Información Personal'),
          ),
          floatingActionButton: state.hasChangedData
              ? FloatingActionButton(
                  elevation: 3,
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh.withOpacity(0.9),
                  tooltip: 'Guardar',
                  onPressed: () {
                    userProfile
                      ?..name = nameController.text
                      ..email = emailController.text
                      ..age = int.tryParse(ageController.text) ?? 13;
                    service.saveUserProfile(shouldUpdate: true);
                    accountSettingCubit.resetState();
                  },
                  child: Icon(
                    Icons.save_rounded,
                    color: color,
                  ),
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      Assets.coreProfileUnchecked,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                      height: 140,
                    ),
                  ),
                  Space.medium.gap,
                  Text(
                    'Nombre',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  NameInputFieldWidget(
                    shouldShowBigNameField: false,
                    controller: nameController,
                    onChanged: (value) {
                      if (nameController.text == userProfile?.name) {
                        accountSettingCubit.revertChangedData();
                      } else if (value) {
                        accountSettingCubit.changeValue();
                      }
                    },
                  ),
                  Space.small.gap,
                  Text(
                    'Email',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  EmailInputFieldWidget(
                    controller: emailController,
                    onChanged: (value) {
                      if (emailController.text == userProfile?.email) {
                        accountSettingCubit.revertChangedData();
                      } else if (value) {
                        accountSettingCubit.changeValue();
                      }
                    },
                  ),
                  Space.smaller_small.gap,
                  Text(
                    'Género',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  GenderSelectionSettingWidget(
                    controller: genderController,
                    onValueChanged: (value) {
                      if (value == getGender(userProfile?.gender ?? '')) {
                        accountSettingCubit.revertChangedData();
                      } else {
                        getMyProfileService().profileAuxGender = value;
                        accountSettingCubit.changeValue();
                      }
                    },
                  ),
                  Space.smaller_small.gap,
                  Text(
                    'Edad',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  AgeSelectorScreen(
                    controller: ageController,
                    onValueChanged: (value) {
                      if (value == userProfile?.age) {
                        accountSettingCubit.revertChangedData();
                      } else {
                        accountSettingCubit.changeValue();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GenderSelectionSettingWidget extends StatefulWidget {
  const GenderSelectionSettingWidget({
    super.key,
    required this.controller,
    this.onValueChanged,
  });

  final ExpansionTileController controller;
  final Function(String value)? onValueChanged;

  @override
  State<GenderSelectionSettingWidget> createState() => _GenderSelectionSettingWidgetState();
}

class _GenderSelectionSettingWidgetState extends State<GenderSelectionSettingWidget> {
  var title = getMyProfileService().userProfile?.gender ?? '';

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500);
    var color = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    return ExpansionTile(
      title: Text(
        getGender(title),
        style: fontStyle,
      ),
      backgroundColor: color,
      collapsedBackgroundColor: color,
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      controller: widget.controller,
      children: [
        getGender(title) != 'Masculino'
            ? ListTile(
                title: Text(
                  'Masculino',
                  style: fontStyle,
                ),
                onTap: () {
                  setState(() {
                    title = 'Masculino';
                  });
                  widget.controller.collapse();
                  widget.onValueChanged?.call(title);
                },
              )
            : const SizedBox(),
        getGender(title) != 'Femenino'
            ? ListTile(
                title: Text(
                  'Femenino',
                  style: fontStyle,
                ),
                onTap: () {
                  setState(() {
                    title = 'Femenino';
                  });
                  widget.controller.collapse();
                  widget.onValueChanged?.call(title);
                },
              )
            : const SizedBox(),
        getGender(title) != 'Prefiero no decirlo'
            ? ListTile(
                title: Text(
                  'Prefiero no decirlo',
                  style: fontStyle,
                ),
                onTap: () {
                  setState(() {
                    title = 'Prefiero no decirlo';
                  });
                  widget.controller.collapse();
                  widget.onValueChanged?.call(title);
                },
              )
            : const SizedBox(),
      ],
    );
  }
}

getGender(String gender) {
  return gender == 'male' || gender == 'Masculino'
      ? 'Masculino'
      : gender == 'female' || gender == 'Femenino'
          ? 'Femenino'
          : 'Prefiero no decirlo';
}

class AgeSelectorScreen extends StatefulWidget {
  const AgeSelectorScreen({
    super.key,
    required this.controller,
    this.onValueChanged,
  });

  final TextEditingController controller;
  final Function(int value)? onValueChanged;

  @override
  _AgeSelectorScreenState createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _updateAge(int newAge) {
    if (newAge >= 12 && newAge <= 120) {
      setState(() {
        widget.controller.text = newAge.toString();
      });
    }
    return int.tryParse(widget.controller.text) ?? 12;
  }

  void _onTextChanged(String value) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      _updateAge(parsed);
    }
  }

  void _onTextComplete(String value) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      _updateAge(parsed >= 12 && parsed <= 120 ? parsed : 12);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 24.0;
    const double iconSize = 28;
    var color = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: padding),
          child: IconButton(
            icon: Icon(
              Icons.remove,
              size: iconSize,
            ),
            onPressed: () {
              var newAge = int.tryParse(widget.controller.text) ?? 13;
              var age = _updateAge(newAge - 1);
              widget.onValueChanged?.call(age);
            },
          ),
        ),
        Expanded(child: SizedBox()),
        SizedBox(
          width: 120,
          child: TextField(
            controller: widget.controller,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            keyboardType: TextInputType.number,
            onChanged: _onTextChanged,
            onEditingComplete: () => _onTextComplete(widget.controller.text),
            onTapOutside: (_) => _onTextComplete(widget.controller.text),
            decoration: InputDecoration(
              fillColor: color,
              focusColor: color,
              hoverColor: color,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(right: padding),
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: iconSize,
            ),
            onPressed: () {
              var newAge = int.tryParse(widget.controller.text) ?? 11;
              var age = _updateAge(newAge + 1);
              widget.onValueChanged?.call(age);
            },
          ),
        ),
      ],
    );
  }
}
