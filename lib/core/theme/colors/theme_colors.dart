part of "package:core_module/core/theme/themes.dart";

/// A set of colors for the entire app.
const ColorScheme colorLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFf51A3FE),
  onPrimary: Colors.white,
  surface: Colors.white,
  onSurface: Color(0xFF121212),
  secondary: Color(0xFF8DD54F),
  onSecondary: Color(0xFFAAAAAA),
  error: Color(0xFFFF2525),
  onError: Colors.white,
  background: Color(0xFFF6F6F6),
  onBackground: Color(0xFF888888),
  surfaceVariant: Color(0xFFF5F5F5),
  secondaryContainer: Color(0xFF343434),
  outline: Color(0xFFE3E5E5),
  shadow: Color(0xFFE7E7E7),
);

///
const ColorScheme colorDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF51A3FE),
  onPrimary: Colors.white,
  surface: Color(0xFF212121),
  onSurface: Colors.white,
  secondary: Color(0xFF8DD54F),
  onSecondary: Color(0xFF333333),
  error: Color(0xFFFF2525),
  onError: Colors.white,
  background: Color(0xFF121212),
  onBackground: Color(0xFFA0A0A0),
  surfaceVariant: Color(0xFF313131),
  secondaryContainer: Color(0xFF8DD54F),
  outline: Color(0xFF656767),
  shadow: Color(0xFFE7E7E7),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.blue,
    required this.pink,
    required this.orange,
    required this.green,
    required this.main,
    required this.disabled,
    required this.tabBarBackground,
    required this.borderColor,
    required this.whiteOpacity05,
    required this.whiteOpacity5,
    required this.primaryText,
    required this.secondaryText,
    required this.unitColor,
  });

  final Color main;
  final Color green;
  final Color blue;
  final Color pink;
  final Color orange;
  final Color tabBarBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color disabled;
  final Color borderColor;
  final Color whiteOpacity05;
  final Color whiteOpacity5;
  final Color unitColor;

  static const ThemeColors light = ThemeColors(
    blue: Color(0xFFADE1FF),
    pink: Color(0xFFFF8AD1),
    main: Color(0xFF26004B),
    green: Color(0xFF8DD54F),
    orange: Color(0xFFFFA200),
    disabled: Color(0xFFF5F5F5),
    primaryText: Color(0xFF121212),
    secondaryText: Color(0xFF888888),
    borderColor: Color.fromRGBO(0, 0, 0, 0.1),
    tabBarBackground: Color(0xFFE7E7E7),
    whiteOpacity05: Color.fromRGBO(255, 255, 255, 0.05),
    whiteOpacity5: Color.fromRGBO(255, 255, 255, 0.5),
    unitColor: Color(0xFFE9E8E8),
  );

  static const ThemeColors dark = ThemeColors(
    blue: Color(0xFFADE1FF),
    pink: Color(0xFFFF8AD1),
    main: Color(0xFF26004B),
    green: Color(0xFF8DD54F),
    orange: Color(0xFFFFA200),
    tabBarBackground: Color(0xFF323232),
    disabled: Color(0xFF424242),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0xFFA0A0A0),
    borderColor: Color.fromRGBO(255, 255, 255, 0.2),
    whiteOpacity05: Color.fromRGBO(255, 255, 255, 0.05),
    whiteOpacity5: Color.fromRGBO(255, 255, 255, 0.5),
    unitColor: Color(0xFF333333),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? tabBarBackground,
    Color? main,
    Color? green,
    Color? whiteOpacity05,
    Color? whiteOpacity5,
    Color? blue,
    Color? pink,
    Color? orange,
    Color? disabled,
    Color? borderColor,
    Color? primaryText,
    Color? secondaryText,
    Color? unitColor,
  }) =>
      ThemeColors(
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
        borderColor: borderColor ?? this.borderColor,
        disabled: disabled ?? this.disabled,
        pink: pink ?? this.pink,
        orange: orange ?? this.orange,
        blue: blue ?? this.blue,
        green: green ?? this.green,
        tabBarBackground: tabBarBackground ?? this.tabBarBackground,
        main: main ?? this.main,
        whiteOpacity05: whiteOpacity05 ?? this.whiteOpacity05,
        whiteOpacity5: whiteOpacity5 ?? this.whiteOpacity5,
        unitColor: unitColor ?? this.unitColor,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      unitColor: Color.lerp(unitColor, other.unitColor, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      whiteOpacity5: Color.lerp(whiteOpacity5, other.whiteOpacity5, t)!,
      green: Color.lerp(green, other.green, t)!,
      main: Color.lerp(main, other.main, t)!,
      tabBarBackground:
          Color.lerp(tabBarBackground, other.tabBarBackground, t)!,
      whiteOpacity05: Color.lerp(whiteOpacity05, other.whiteOpacity05, t)!,
    );
  }
}
