import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/core/widgets/pop_widget.dart';
import 'package:harmoni/core/widgets/spacer.dart';
import 'package:harmoni/features/settings/presentation/state_management/style_setting/style_setting_cubit.dart';

import '../../../../generated/assets.dart';

class StyleSettingPage extends StatelessWidget {
  const StyleSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400);
    return BlocBuilder<StyleSettingCubit, StyleSettingState>(
      buildWhen: (previous, current) {
        var previousBrightness = (previous as StyleSettingInitial).brightness;
        var previousColor = previous.color;
        var previousContrast = previous.contrastLevel;
        var previousEmojiType = previous.emojiType;

        var currentBrightness = (current as StyleSettingInitial).brightness;
        var currentColor = current.color;
        var currentContrast = current.contrastLevel;
        var currentEmojiType = current.emojiType;

        return previousBrightness != currentBrightness || previousColor != currentColor || previousContrast != currentContrast || previousEmojiType != currentEmojiType;
      },
      builder: (context, state) {
        double emojiSize = 48;
        return Scaffold(
          appBar: AppBar(
            title: Text('Apariencia'),
            leading: PopWidget(
              beforePop: () {
                getMyProfileService().userProfile?.settings == null ? getMyProfileService().userProfile?.settings = {} : true;
                getMyProfileService().userProfile?.settings?.addAll({
                  'brightness': (state as StyleSettingInitial).brightness == Brightness.dark ? Brightness.dark.name : Brightness.light.name,
                  'color': state.color.value,
                  'contrastLevel': state.contrastLevel,
                  'emojiType': state.emojiType,
                  'colorIndex': state.colorIndex,
                });
                getMyProfileService().saveSettings(getMyProfileService().userProfile?.settings ?? {});
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  iconSize: 32,
                  onPressed: () {
                    context.read<StyleSettingCubit>().changeBrightness(
                          Brightness.light == state.brightness ? Brightness.dark : Brightness.light,
                        );
                  },
                  icon: Icon(
                    (state as StyleSettingInitial).brightness == Brightness.dark ? Icons.sunny : Icons.nights_stay,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.small.gap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 180,
                    width: double.infinity,
                    child: SizedBox(),
                  ),
                ),
                Space.small.gap,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        ...colors.map(
                          (e) {
                            var colorData = e as Map<String, dynamic>?;
                            double colorSize = 24;
                            return IconButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(colorData?['color']),
                                shape: WidgetStatePropertyAll(
                                  CircleBorder(
                                    side: BorderSide.none,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context.read<StyleSettingCubit>().changeColor(colorData?['color'], colorData?['index']);
                              },
                              iconSize: colorSize,
                              icon: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                width: colorSize,
                                height: colorSize,
                                decoration: BoxDecoration(
                                  color: colorData?['color'],
                                  borderRadius: BorderRadius.circular(32),
                                  border: colorData?['index'] == state.colorIndex ? Border.all(color: Theme.of(context).colorScheme.surface, width: 3) : null,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Space.medium.gap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('Contraste de colores', style: fontStyle),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SliderCustomWidget(
                    value: (state.contrastLevel + 1) / 2,
                  ),
                ),
                Space.small.gap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('Tipo de emoji', style: fontStyle),
                ),
                Space.smaller_small.gap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.ghostHappyGhost,
                          colorFilter: ColorFilter.mode(
                            state.emojiType == EmojiType.ghost.name ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: emojiSize,
                          height: emojiSize,
                        ),
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          state.emojiType == EmojiType.ghost.name ? Theme.of(context).colorScheme.primary : null,
                        )),
                        onPressed: () {
                          context.read<StyleSettingCubit>().changeEmojiType(EmojiType.ghost.name);
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.circleHappyCircle,
                          colorFilter: ColorFilter.mode(
                            state.emojiType == EmojiType.circle.name ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: emojiSize,
                          height: emojiSize,
                        ),
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          state.emojiType == EmojiType.circle.name ? Theme.of(context).colorScheme.primary : null,
                        )),
                        onPressed: () {
                          context.read<StyleSettingCubit>().changeEmojiType(EmojiType.circle.name);
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.rectHappyRect,
                          colorFilter: ColorFilter.mode(
                            state.emojiType == EmojiType.rect.name ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: emojiSize,
                          height: emojiSize,
                        ),
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          state.emojiType == EmojiType.rect.name ? Theme.of(context).colorScheme.primary : null,
                        )),
                        onPressed: () {
                          context.read<StyleSettingCubit>().changeEmojiType(EmojiType.rect.name);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SliderCustomWidget extends StatefulWidget {
  const SliderCustomWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  State<SliderCustomWidget> createState() => _SliderCustomWidgetState();
}

class _SliderCustomWidgetState extends State<SliderCustomWidget> {
  var contrastLevel = 0.0;
  bool hasChanged = false;

  @override
  Widget build(BuildContext context) {
    if (!hasChanged) contrastLevel = widget.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Slider(
            value: contrastLevel,
            divisions: 20,
            onChanged: (value) {
              setState(() {
                contrastLevel = value;
                hasChanged = true;
              });
            },
            onChangeEnd: (value) {
              context.read<StyleSettingCubit>().changeContrastLevel((value * 2) - 1);
            },
          ),
        ),
        Text(
          '${(contrastLevel * 100).truncate()}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(0.7),
              ),
        ),
      ],
    );
  }
}

final colors = [
  {'color': Colors.purple, 'index': 0},
  {'color': Colors.indigo, 'index': 1},
  {'color': Colors.blue, 'index': 2},
  {'color': Colors.cyan, 'index': 3},
  {'color': Colors.teal, 'index': 4},
  {'color': Colors.green, 'index': 5},
  {'color': Colors.lime, 'index': 6},
  {'color': Colors.yellow, 'index': 7},
  {'color': Colors.amber, 'index': 8},
  {'color': Colors.orange, 'index': 9},
  {'color': Colors.red, 'index': 10},
  {'color': Colors.pink, 'index': 11},
  {'color': Colors.brown, 'index': 12},
  {'color': Colors.blueGrey, 'index': 13},
  {'color': Colors.grey, 'index': 14}
];
