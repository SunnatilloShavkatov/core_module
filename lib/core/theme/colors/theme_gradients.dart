part of "package:core_module/core/theme/themes.dart";

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  const ThemeGradients({
    required this.buttonLinearGradient,
    required this.unitLinearGradient,
    required this.libraryLinearGradient,
    required this.supportLinearGradient,
    required this.faqLinearGradient,
  });

  final LinearGradient buttonLinearGradient;
  final LinearGradient unitLinearGradient;
  final LinearGradient libraryLinearGradient;
  final LinearGradient supportLinearGradient;
  final LinearGradient faqLinearGradient;

  static const ThemeGradients light = ThemeGradients(
    buttonLinearGradient: LinearGradient(
      colors: <Color>[
        Color(0xFF2277F6),
        Color(0xFF1364DD),
      ],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    unitLinearGradient: LinearGradient(
      colors: <Color>[
        Color(0xFF8590FA),
        Color(0xFF5564F0),
      ],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    libraryLinearGradient: LinearGradient(
      colors: <Color>[
        Color(0xFFFCB360),
        Color(0xFFFFA200),
      ],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    supportLinearGradient: LinearGradient(
      colors: <Color>[
        Color(0xFF6CADFD),
        Color(0xFF51A3FE),
      ],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    faqLinearGradient: LinearGradient(
      colors: <Color>[
        Color(0xFFACE380),
        Color(0xFF8DD54F),
      ],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
  static const ThemeGradients dark = ThemeGradients(
    buttonLinearGradient: LinearGradient(
      colors: <Color>[Color(0xFF2277F6), Color(0xFF1364DD)],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    unitLinearGradient: LinearGradient(
      colors: <Color>[Color(0xFF2277F6), Color(0xFF1364DD)],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    libraryLinearGradient: LinearGradient(
      colors: <Color>[Color(0xFFFC966A), Color(0xFFFF6F31)],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    supportLinearGradient: LinearGradient(
      colors: <Color>[Color(0xFF5BE1F8), Color(0xFF03BCDB)],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    faqLinearGradient: LinearGradient(
      colors: <Color>[Color(0xFF46DF93), Color(0xFF22C272)],
      stops: <double>[0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  @override
  ThemeExtension<ThemeGradients> copyWith({
    LinearGradient? buttonLinearGradient,
    LinearGradient? unitLinearGradient,
    LinearGradient? libraryLinearGradient,
    LinearGradient? supportLinearGradient,
    LinearGradient? faqLinearGradient,
  }) =>
      ThemeGradients(
        faqLinearGradient: faqLinearGradient ?? this.faqLinearGradient,
        supportLinearGradient:
            supportLinearGradient ?? this.supportLinearGradient,
        buttonLinearGradient: buttonLinearGradient ?? this.buttonLinearGradient,
        unitLinearGradient: unitLinearGradient ?? this.unitLinearGradient,
        libraryLinearGradient:
            libraryLinearGradient ?? this.libraryLinearGradient,
      );

  @override
  ThemeExtension<ThemeGradients> lerp(
    ThemeExtension<ThemeGradients>? other,
    double t,
  ) {
    if (other is! ThemeGradients) {
      return this;
    }
    return ThemeGradients(
      buttonLinearGradient: LinearGradient.lerp(
        buttonLinearGradient,
        other.buttonLinearGradient,
        t,
      )!,
      unitLinearGradient: LinearGradient.lerp(
        unitLinearGradient,
        other.unitLinearGradient,
        t,
      )!,
      libraryLinearGradient: LinearGradient.lerp(
        libraryLinearGradient,
        other.libraryLinearGradient,
        t,
      )!,
      supportLinearGradient: LinearGradient.lerp(
        supportLinearGradient,
        other.supportLinearGradient,
        t,
      )!,
      faqLinearGradient: LinearGradient.lerp(
        faqLinearGradient,
        other.faqLinearGradient,
        t,
      )!,
    );
  }
}
