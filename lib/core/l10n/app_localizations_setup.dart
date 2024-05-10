import "dart:async" show Future;
import "dart:convert" show json;

import "package:flutter/cupertino.dart";
import "package:flutter/services.dart" show rootBundle;
import "package:flutter_localizations/flutter_localizations.dart";

part "app_localizations_delegate.dart";

part "app_localizations.dart";

sealed class AppLocalizationsSetup {
  AppLocalizationsSetup._();

  static const List<Locale> supportedLocales = <Locale>[
    Locale("en", "US"),
    Locale("ru", "RU"),
    Locale("uz", "UZ"),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];
}
