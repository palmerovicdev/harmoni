part of 'style_setting_cubit.dart';

sealed class StyleSettingState extends Equatable {
  const StyleSettingState();
}

final class StyleSettingInitial extends StyleSettingState {
  final Brightness brightness;
  final Color color;
  final double contrastLevel;
  final String emojiType;

  const StyleSettingInitial({required this.brightness, required this.color, required this.contrastLevel, required this.emojiType});

  @override
  List<Object> get props => [brightness, color, contrastLevel, emojiType];

  StyleSettingInitial copyWith({Brightness? brightness, Color? color, double? contrastLevel, String? emojiType}) {
    return StyleSettingInitial(
      brightness: brightness ?? this.brightness,
      color: color ?? this.color,
      contrastLevel: contrastLevel ?? this.contrastLevel,
      emojiType: emojiType ?? this.emojiType,
    );
  }
}
