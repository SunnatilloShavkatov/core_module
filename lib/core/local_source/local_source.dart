// import "package:core_module/app_options.dart";
// import "package:core_module/constants/.env.dart";
// import "package:core_module/constants/constants.dart";
// import "package:core_module/core/utils/utils.dart";
// import "package:flutter/material.dart";
// import "package:hive/hive.dart";
//
// final class LocalSource {
//   LocalSource(this.box);
//
//   final Box<dynamic> box;
//
//   bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);
//
//   Future<void> setHasProfile({required bool value}) async {
//     await box.put(AppKeys.hasProfile, value);
//   }
//
//   Future<void> setLocale(String locale) async {
//     await box.put(AppKeys.locale, locale);
//   }
//
//   String get locale => box.get(AppKeys.locale, defaultValue: defaultLocale);
//
//   ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
//         "system" => ThemeMode.system,
//         "light" => ThemeMode.light,
//         "dark" => ThemeMode.dark,
//         _ => ThemeMode.system,
//       };
//
//   Future<void> setThemeMode(ThemeMode mode) async {
//     await box.put(AppKeys.themeMode, mode.name);
//   }
//
//   Future<void> setAccessToken(String accessToken) async {
//     await box.put(AppKeys.accessToken, accessToken);
//   }
//
//   String get accessToken =>
//       "Bearer ${box.get(AppKeys.accessToken, defaultValue: "")}";
//
//   Future<void> setCertificate(String ca) async {
//     await box.put(AppKeys.certificate, ca);
//   }
//
//   String get certificate => box.get(AppKeys.certificate, defaultValue: "");
//
//   Future<void> setIsForProduction({required bool value}) async {
//     await box.put(AppKeys.isForProduction, value);
//   }
//
//   bool get isForProduction =>
//       box.get(AppKeys.isForProduction, defaultValue: false);
//
//   Future<void> setFirstName(String firstName) async {
//     await box.put(AppKeys.firstname, firstName);
//   }
//
//   String get firstname => box.get(AppKeys.firstname, defaultValue: "");
//
//   Future<void> setLastName(String lastName) async {
//     await box.put(AppKeys.lastname, lastName);
//   }
//
//   String get lastname => box.get(AppKeys.lastname, defaultValue: "");
//
//   Future<void> setUserName(String username) async {
//     await box.put(AppKeys.username, username);
//   }
//
//   String get username => box.get(AppKeys.username, defaultValue: "");
//
//   Future<void> setUserId(int value) async {
//     await box.put(AppKeys.userId, value);
//   }
//
//   int get userId => box.get(AppKeys.userId, defaultValue: 0);
//
//   Future<void> setFullUrl(String value) async {
//     await box.put(AppKeys.fullUrl, value);
//   }
//
//   String get fullUrl => box.get(AppKeys.fullUrl, defaultValue: "");
//
//   Future<void> setPaymentAccess(int value) async {
//     await box.put(AppKeys.paymentAccess, value);
//   }
//
//   int get paymentAccess => box.get(AppKeys.paymentAccess, defaultValue: 0);
//
//   Future<void> setPaymentLink(String value) async {
//     await box.put(AppKeys.paymentLink, value);
//   }
//
//   String get paymentLink => box.get(AppKeys.paymentLink, defaultValue: "");
//
//   String get fullName => "$firstname $lastname";
//
//   Future<void> setEmail(String email) async {
//     await box.put(AppKeys.email, email);
//   }
//
//   String get email => box.get(AppKeys.email, defaultValue: "");
//
//   Future<void> setPassword(String password) async {
//     await box.put(AppKeys.password, password);
//   }
//
//   String get password => box.get(AppKeys.password, defaultValue: "");
//
//   Future<void> setSound(Sound value) async {
//     await box.put(AppKeys.sound, value.index);
//   }
//
//   Sound get sound =>
//       Sound.values[box.get(AppKeys.sound, defaultValue: Sound.on.index)];
//
//   Future<void> setFirstChat({required bool value}) async {
//     await box.put(AppKeys.firstChat, value);
//   }
//
//   bool get firstChat => box.get(AppKeys.firstChat, defaultValue: true);
//
//   Future<void> setEnv({required Environment value}) async {
//     await box.put(AppKeys.environment, value.name);
//   }
//
//   Environment get env => box
//       .get(AppKeys.environment, defaultValue: Environment.prod.name)
//       .toString()
//       .toEnv;
//
//   Future<void> setValue<T>({
//     required String key,
//     required T value,
//   }) async {
//     await box.put(key, value);
//   }
//
//   T? getValue<T>({
//     required String key,
//   }) =>
//       box.get(key, defaultValue: null);
//
//   Future<void> clear() async {
//     final String cert = certificate;
//     await box.clear();
//     await box.put(AppKeys.certificate, cert);
//   }
// }
