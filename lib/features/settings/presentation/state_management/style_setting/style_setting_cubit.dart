import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:harmoni/core/helpers/settings_enums.dart';

part 'style_setting_state.dart';

class StyleSettingCubit extends Cubit<StyleSettingState> {
  StyleSettingCubit() : super(StyleSettingInitial(brightness: Brightness.light, color: Colors.blue, contrastLevel: 0, emojiType: EmojiType.circle.name, colorIndex: 0));

  changeColor(Color color, int index) {
    emit((state as StyleSettingInitial).copyWith(color: color, colorIndex: index));
  }

  changeBrightness(Brightness brightness) {
    emit((state as StyleSettingInitial).copyWith(brightness: brightness));
  }

  changeContrastLevel(double level) {
    emit((state as StyleSettingInitial).copyWith(contrastLevel: level));
  }

  changeEmojiType(String emojiType) {
    emit((state as StyleSettingInitial).copyWith(emojiType: emojiType));
  }

  changeAll({required Brightness brightness, required Color color, required double contrastLevel, required String emojiType, required int colorIndex}) {
    emit((state as StyleSettingInitial).copyWith(brightness: brightness, color: color, contrastLevel: contrastLevel, emojiType: emojiType, colorIndex: colorIndex));
  }
}
