part of "extension.dart";

extension SoundExtension on Sound {
  bool get isOn => this == Sound.on;
}

extension ThemeModeExtensionX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;

  bool get isLight => this == ThemeMode.light;
}

extension ThemeModeExtension on bool {
  Sound get sound => this ? Sound.on : Sound.off;

  ThemeMode get themeMode => this ? ThemeMode.dark : ThemeMode.light;
}
