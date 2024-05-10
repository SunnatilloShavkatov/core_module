part of "themes.dart";

const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: Colors.transparent,
  // ios
  statusBarBrightness: Brightness.light,
  // android
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
);

const SystemUiOverlayStyle systemDarkUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Color(0xFF212121),
  systemNavigationBarDividerColor: Colors.transparent,
  // ios
  statusBarBrightness: Brightness.dark,
  // android
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.light,
    ThemeGradients.light,
    ThemeTextStyles.light,
    ThemeCustomShapes.light,
  ],
  pageTransitionsTheme: const PageTransitionsTheme(),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: colorLightScheme.primary,
  colorScheme: colorLightScheme,
  dialogBackgroundColor: colorLightScheme.surface,
  scaffoldBackgroundColor: colorLightScheme.background,
  focusColor: colorLightScheme.primary,
  highlightColor: Colors.transparent,
  cardColor: colorLightScheme.surface,
  canvasColor: colorLightScheme.surface,
  shadowColor: const Color(0xFFE7E7E7),
  scrollbarTheme: const ScrollbarThemeData(
    radius: AppUtils.kRadius12,
    interactive: true,
    thickness: MaterialStatePropertyAll<double>(4),
    thumbVisibility: MaterialStatePropertyAll<bool>(false),
    trackVisibility: MaterialStatePropertyAll<bool>(false),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: TargetPlatform.android == defaultTargetPlatform
          ? const Icon(Icons.arrow_back_rounded)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    insetPadding: EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorLightScheme.primary,
    linearMinHeight: 8,
    linearTrackColor: const Color.fromRGBO(255, 255, 255, 0.5),
    circularTrackColor: Colors.white,
  ),
  dividerColor: colorLightScheme.outline,
  dividerTheme: DividerThemeData(
    thickness: 1,
    color: colorLightScheme.outline,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: colorLightScheme.surface,
    surfaceTintColor: colorLightScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorLightScheme.secondary,
    foregroundColor: Colors.white,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    shape: const CircleBorder(),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: colorLightScheme.surface,
    surfaceTintColor: colorLightScheme.surface,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFA9ADB0);
          }
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFF5F5F5);
          } else if (states.contains(MaterialState.pressed)) {
            return colorLightScheme.primary;
          }
          return colorLightScheme.primary;
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
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => Colors.black,
      ),
      side: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => BorderSide(
          color: ThemeColors.light.borderColor,
        ),
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
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.zero,
      ),
      foregroundColor: const MaterialStatePropertyAll<Color>(
        Color(0xFF3D3D3D),
      ),
      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
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
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorLightScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.primary),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.error),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.outline),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorLightScheme.error),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    showDragHandle: false,
    shadowColor: Color(0xFFE6E9EF),
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: colorLightScheme.surface,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    selectedItemColor: colorLightScheme.primary,
    unselectedItemColor: colorLightScheme.onBackground,
    selectedIconTheme: IconThemeData(color: colorLightScheme.primary),
    unselectedIconTheme: IconThemeData(color: colorLightScheme.onBackground),
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: colorLightScheme.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: ThemeColors.light.primaryText,
    unselectedLabelColor: ThemeColors.light.secondaryText,
    dividerColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
    labelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    indicator: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      color: colorLightScheme.surface,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(20, 20, 20, 0.08),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Color.fromRGBO(20, 20, 20, 0.04),
          blurRadius: 1,
        ),
      ],
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: const MaterialStatePropertyAll<IconThemeData>(
      IconThemeData(color: Colors.black),
    ),
    labelTextStyle: MaterialStatePropertyAll<TextStyle>(
      ThemeTextStyles.light.appBarTitle,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 1,
    scrolledUnderElevation: 1,
    shadowColor: const Color(0xFFFAFAFA),
    systemOverlayStyle: systemUiOverlayStyle,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      fontSize: 16,
      color: Color(0xFF3D3D3D),
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: ThemeTextStyles.light.appBarTitle,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 0,
    margin: EdgeInsets.zero,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      height: 29 / 24,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),

    /// text field title style
    titleMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),

    /// list tile title style
    bodyLarge: TextStyle(
      color: ThemeColors.light.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    /// list tile subtitle style
    bodyMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),

    /// display style
    displayLarge: TextStyle(
      fontSize: 30,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.light.secondaryText,
      fontWeight: FontWeight.w400,
    ),

    /// headline style
    headlineLarge: TextStyle(
      fontSize: 20,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w500,
    ),

    /// subtitle style
    labelLarge: TextStyle(
      fontSize: 20,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.light.primaryText,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.dark,
    ThemeGradients.dark,
    ThemeTextStyles.dark,
    ThemeCustomShapes.dark,
  ],
  pageTransitionsTheme: const PageTransitionsTheme(),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  focusColor: colorLightScheme.primary,
  highlightColor: Colors.transparent,
  primaryColor: colorDarkScheme.primary,
  colorScheme: colorDarkScheme,
  dialogBackgroundColor: colorDarkScheme.surface,
  scaffoldBackgroundColor: colorDarkScheme.background,
  cardColor: colorDarkScheme.surface,
  canvasColor: colorDarkScheme.surface,
  shadowColor: const Color(0xFFE7E7E7),
  scrollbarTheme: const ScrollbarThemeData(
    radius: AppUtils.kRadius12,
    interactive: true,
    thickness: MaterialStatePropertyAll<double>(4),
    thumbVisibility: MaterialStatePropertyAll<bool>(false),
    trackVisibility: MaterialStatePropertyAll<bool>(false),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: TargetPlatform.android == defaultTargetPlatform
          ? const Icon(Icons.arrow_back_rounded)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
    linearMinHeight: 8,
    linearTrackColor: Colors.white,
    circularTrackColor: Colors.transparent,
  ),
  dividerColor: colorDarkScheme.outline,
  dividerTheme: DividerThemeData(
    thickness: 1,
    color: colorDarkScheme.outline,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: colorDarkScheme.surface,
    surfaceTintColor: colorDarkScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorLightScheme.secondary,
    foregroundColor: Colors.white,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    shape: const CircleBorder(),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: colorDarkScheme.surface,
    surfaceTintColor: colorDarkScheme.surface,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFA0A0A0);
          }
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFF424242);
          } else if (states.contains(MaterialState.pressed)) {
            return colorDarkScheme.primary;
          }
          return colorDarkScheme.primary;
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
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => Colors.white,
      ),
      side: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => BorderSide(
          color: ThemeColors.dark.borderColor,
        ),
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
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.zero,
      ),
      foregroundColor: const MaterialStatePropertyAll<Color>(
        Color(0xFF3D3D3D),
      ),
      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
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
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorLightScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.primary),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.error),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.outline),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius12,
      borderSide: BorderSide(color: colorDarkScheme.error),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    elevation: 0,
    showDragHandle: false,
    shadowColor: const Color(0xFFE6E9EF),
    backgroundColor: colorDarkScheme.surface,
    surfaceTintColor: colorDarkScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: colorDarkScheme.surface,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    selectedItemColor: colorDarkScheme.primary,
    unselectedItemColor: colorDarkScheme.onBackground,
    selectedIconTheme: IconThemeData(color: colorDarkScheme.primary),
    unselectedIconTheme: IconThemeData(color: colorDarkScheme.onBackground),
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: colorDarkScheme.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: ThemeColors.dark.primaryText,
    unselectedLabelColor: ThemeColors.dark.secondaryText,
    dividerColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
    labelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    indicator: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      color: colorDarkScheme.surface,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(20, 20, 20, 0.08),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Color.fromRGBO(20, 20, 20, 0.04),
          blurRadius: 1,
        ),
      ],
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
      (Set<MaterialState> states) => const IconThemeData(
        color: Colors.black,
      ),
    ),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) => ThemeTextStyles.dark.appBarTitle,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 1,
    scrolledUnderElevation: 1,
    shadowColor: const Color(0xFFE7E7E7),
    systemOverlayStyle: systemDarkUiOverlayStyle,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: ThemeTextStyles.dark.appBarTitle,
    backgroundColor: const Color(0xFF212121),
    surfaceTintColor: const Color(0xFF212121),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Color(0xFF212121),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    margin: EdgeInsets.zero,
    color: colorDarkScheme.surface,
    surfaceTintColor: colorDarkScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      height: 29 / 24,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),

    /// text field title style
    titleMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),

    /// list tile title style
    bodyLarge: TextStyle(
      color: ThemeColors.dark.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    /// list tile subtitle style
    bodyMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),

    /// display style
    displayLarge: TextStyle(
      fontSize: 30,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.dark.secondaryText,
      fontWeight: FontWeight.w400,
    ),

    /// headline style
    headlineLarge: TextStyle(
      fontSize: 20,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w500,
    ),

    /// subtitle style
    labelLarge: TextStyle(
      fontSize: 20,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 17,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 15,
      color: ThemeColors.dark.primaryText,
      fontWeight: FontWeight.w600,
    ),
  ),
);
