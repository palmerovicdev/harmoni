import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/core/widgets/spacer.dart';
import 'package:harmoni/features/settings/presentation/state_management/account_setting/account_setting_cubit.dart';
import 'package:harmoni/features/settings/presentation/widget/setting_text_field_widget.dart';

import '../../../../generated/assets.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSettingCubit, AccountSettingState>(
      builder: (context, state) {
        var color = Theme.of(context).colorScheme.primary;
        var fontStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500);
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Informacion Personal'),
          ),
          floatingActionButton: null,
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
                  SettingTextFieldWidget(textController: TextEditingController(text: getMyProfileService().userProfile?.name)),
                  Space.small.gap,
                  Text(
                    'Email',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  SettingTextFieldWidget(
                    textController: TextEditingController(text: getMyProfileService().userProfile?.email),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 10),
                      child: Icon(Icons.mark_email_read_rounded, color: color),
                    ),
                  ),
                  Space.smaller_small.gap,
                  Text(
                    'Genero',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  GenderSelectionSettingWidget(
                    controller: ExpansionTileController(),
                  ),
                  Space.smaller_small.gap,
                  Text(
                    'Edad',
                    style: fontStyle,
                  ),
                  Space.smaller_small.gap,
                  AgeSelectorScreen(
                    controller: TextEditingController(text: getMyProfileService().userProfile?.age.toString()),
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
  });

  final ExpansionTileController controller;

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
                },
              )
            : const SizedBox(),
      ],
    );
  }

  getGender(String gender) {
    return gender == 'male' || gender == 'Masculino'
        ? 'Masculino'
        : gender == 'female' || gender == 'Femenino'
            ? 'Femenino'
            : 'Prefiero no decirlo';
  }
}

class AgeSelectorScreen extends StatefulWidget {
  const AgeSelectorScreen({super.key, required this.controller});

  final TextEditingController controller;

  @override
  _AgeSelectorScreenState createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _updateAge(int newAge) {
    if (newAge >= 12 && newAge <= 120) {
      setState(() {
        widget.controller.text = newAge.toString();
      });
    }
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
              _updateAge(newAge - 1);
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
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
              _updateAge(newAge + 1);
            },
          ),
        ),
      ],
    );
  }
}
