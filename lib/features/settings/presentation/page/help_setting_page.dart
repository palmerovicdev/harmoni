import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/core/widgets/spacer.dart';
import 'package:harmoni/features/settings/presentation/state_management/help_setting/help_setting_cubit.dart';

class HelpSettingPage extends StatelessWidget {
  const HelpSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var fontStyle2 = textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
    return BlocBuilder<HelpSettingCubit, HelpSettingState>(
      builder: (context, state) {
        var theme = Theme.of(context).colorScheme;
        var buttonStyle = ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(theme.primary),
          foregroundColor: WidgetStatePropertyAll(theme.onPrimary),
          overlayColor: WidgetStatePropertyAll(theme.onPrimary.withOpacity(0.1)),
        );
        return Scaffold(
          appBar: AppBar(
            leading: PopWidget(),
            title: Text('Ayuda'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  Icon(
                    Icons.help,
                    size: 140,
                    color: theme.primary,
                  ),
                  Space.small.gap,
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            OutlinedButton(
                              onPressed: () => context.read<HelpSettingCubit>().selectIndex(index),
                              style: (state as HelpSettingInitial).selectedCategory == index ? buttonStyle : null,
                              child: Text(
                                getCategories()[index],
                              ),
                            ),
                            Space.small_w.gap,
                          ],
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: getCategories().length,
                    ),
                  ),
                  Space.small.gap,
                  ...?helpInformation[getCategories()[(state as HelpSettingInitial).selectedCategory].toString().toLowerCase()]?.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ExpansionTile(
                        title: Text(
                          (e as Map<String, dynamic>).keys.first,
                          style: fontStyle2,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        collapsedBackgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
                            child: Text(
                              e.values.first,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getCategories() {
    return ['General', 'Emociones', 'Cuenta', 'Calendario'];
  }
}
