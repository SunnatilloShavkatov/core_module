part of "themes.dart";

class ThemeCustomShapes extends ThemeExtension<ThemeCustomShapes> {
  const ThemeCustomShapes({
    required this.cardDecoration,
    required this.successButtonStyle,
    required this.gotItDecoration,
    required this.successAnswerDecoration,
    this.topRectangleBorder,
    this.bottomNavigationShape,
    required this.playButtonStyle,
    required this.cancelReplyButtonStyle,
    required this.chooseOptionDecoration,
  });

  final OutlinedBorder? topRectangleBorder;
  final OutlinedBorder? bottomNavigationShape;
  final Decoration cardDecoration;
  final Decoration chooseOptionDecoration;
  final Decoration gotItDecoration;
  final Decoration successAnswerDecoration;
  final ButtonStyle successButtonStyle;
  final ButtonStyle playButtonStyle;
  final ButtonStyle cancelReplyButtonStyle;

  static final ThemeCustomShapes light = ThemeCustomShapes(
    chooseOptionDecoration: BoxDecoration(
      color: colorLightScheme.surface,
      borderRadius: AppUtils.kBorderRadius12,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: 12,
          offset: Offset(0, 2),
        ),
      ],
    ),
    cancelReplyButtonStyle: const ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.zero,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconSize: MaterialStatePropertyAll<double>(20),
    ),
    playButtonStyle: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.zero,
      ),
      backgroundColor: MaterialStatePropertyAll<Color>(
        colorLightScheme.primary,
      ),
      foregroundColor: MaterialStatePropertyAll<Color>(
        colorLightScheme.onPrimary,
      ),
    ),
    topRectangleBorder: const CustomRectangleBorder(
      isTop: true,
      side: BorderSide(color: Color(0xFFE7E7E7)),
    ),
    gotItDecoration: const BoxDecoration(
      color: Color(0xFFF65039),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    successAnswerDecoration: const BoxDecoration(
      color: Color(0xFF29CF7D),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    bottomNavigationShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    cardDecoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    successButtonStyle: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFE5E5E5);
          } else if (states.contains(MaterialState.pressed)) {
            return const Color(0xFF8DD54F);
          }
          return const Color(0xFF8DD54F);
        },
      ),
      textStyle: MaterialStatePropertyAll<TextStyle>(
        ThemeTextStyles.light.buttonStyle,
      ),
      elevation: const MaterialStatePropertyAll<double>(0),
      shape: const MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
    ),
  );

  static final ThemeCustomShapes dark = ThemeCustomShapes(
    chooseOptionDecoration: BoxDecoration(
      color: colorDarkScheme.surface,
      borderRadius: AppUtils.kBorderRadius12,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          blurRadius: 12,
          offset: Offset(0, 2),
        ),
      ],
    ),
    cancelReplyButtonStyle: const ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.zero,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconSize: MaterialStatePropertyAll<double>(20),
    ),
    playButtonStyle: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.zero,
      ),
      backgroundColor: MaterialStatePropertyAll<Color>(
        colorDarkScheme.primary,
      ),
      foregroundColor: MaterialStatePropertyAll<Color>(
        colorDarkScheme.onPrimary,
      ),
    ),
    gotItDecoration: const BoxDecoration(
      color: Color(0xFFF65039),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    successAnswerDecoration: const BoxDecoration(
      color: Color(0xFF29CF7D),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    topRectangleBorder: const CustomRectangleBorder(
      isTop: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    bottomNavigationShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    cardDecoration: const BoxDecoration(
      color: Color(0xFF212121),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    successButtonStyle: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFE5E5E5);
          } else if (states.contains(MaterialState.pressed)) {
            return const Color.fromRGBO(41, 207, 125, 0.5);
          }
          return const Color.fromRGBO(41, 207, 125, 1);
        },
      ),
      textStyle: MaterialStatePropertyAll<TextStyle>(
        ThemeTextStyles.dark.buttonStyle,
      ),
      elevation: const MaterialStatePropertyAll<double>(0),
      shape: const MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
    ),
  );

  @override
  ThemeExtension<ThemeCustomShapes> copyWith({
    CustomRectangleBorder? topRectangleBorder,
    CustomRectangleBorder? bottomShapeAppBar,
    CustomRectangleBorder? bottomNavigationShape,
    Decoration? cardDecoration,
    Decoration? gotItDecoration,
    Decoration? successAnswerDecoration,
    Decoration? buttonsShadowDecoration,
    ButtonStyle? successButtonStyle,
    ButtonStyle? playButtonStyle,
    ButtonStyle? cancelReplyButtonStyle,
    Decoration? chooseOptionDecoration,
  }) =>
      ThemeCustomShapes(
        chooseOptionDecoration:
            chooseOptionDecoration ?? this.chooseOptionDecoration,
        cancelReplyButtonStyle:
            cancelReplyButtonStyle ?? this.cancelReplyButtonStyle,
        playButtonStyle: playButtonStyle ?? this.playButtonStyle,
        successAnswerDecoration:
            successAnswerDecoration ?? this.successAnswerDecoration,
        gotItDecoration: gotItDecoration ?? this.gotItDecoration,
        topRectangleBorder: topRectangleBorder ?? this.topRectangleBorder,
        bottomNavigationShape:
            bottomNavigationShape ?? this.bottomNavigationShape,
        cardDecoration: cardDecoration ?? this.cardDecoration,
        successButtonStyle: successButtonStyle ?? this.successButtonStyle,
      );

  @override
  ThemeExtension<ThemeCustomShapes> lerp(
    ThemeExtension<ThemeCustomShapes>? other,
    double t,
  ) {
    if (other is! ThemeCustomShapes) {
      return this;
    }
    return ThemeCustomShapes(
      chooseOptionDecoration: Decoration.lerp(
        other.chooseOptionDecoration,
        chooseOptionDecoration,
        t,
      )!,
      cancelReplyButtonStyle: ButtonStyle.lerp(
        other.cancelReplyButtonStyle,
        cancelReplyButtonStyle,
        t,
      )!,
      playButtonStyle: ButtonStyle.lerp(
        other.playButtonStyle,
        playButtonStyle,
        t,
      )!,
      successAnswerDecoration: Decoration.lerp(
        other.successAnswerDecoration,
        successAnswerDecoration,
        t,
      )!,
      gotItDecoration: Decoration.lerp(
        other.gotItDecoration,
        gotItDecoration,
        t,
      )!,
      successButtonStyle: ButtonStyle.lerp(
        other.successButtonStyle,
        successButtonStyle,
        t,
      )!,
      topRectangleBorder: OutlinedBorder.lerp(
        other.topRectangleBorder,
        topRectangleBorder,
        t,
      ),
      bottomNavigationShape: OutlinedBorder.lerp(
        other.bottomNavigationShape,
        bottomNavigationShape,
        t,
      ),
      cardDecoration: Decoration.lerp(
        other.cardDecoration,
        cardDecoration,
        t,
      )!,
    );
  }
}
