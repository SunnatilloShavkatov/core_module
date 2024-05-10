part of "utils.dart";

final String defaultSystemLocale = Platform.localeName.split("_").first;
final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

Future<Size> loadImageSize(File file) async {
  final Uint8List data = await file.readAsBytes();
  final ui.Codec codec = await ui.instantiateImageCodec(data);
  final ui.FrameInfo fi = await codec.getNextFrame();
  return Size(fi.image.width.toDouble(), fi.image.height.toDouble());
}

// void logEventAnalytics({
//   required String name,
//   Map<String, Object>? parameters,
// }) {
//   // ignore: discarded_futures
//   _firebaseAnalytics.logEvent(
//     name: name,
//     parameters: <String, Object>{
//       if (localSource.userId != 0) "userId": localSource.userId,
//       if (localSource.fullName.isNotEmpty) "fullName": localSource.fullName,
//       if (parameters != null) ...parameters,
//     },
//   );
//   if (Platform.isIOS || Platform.isAndroid) {
//     // ignore: discarded_futures
//     AppMetrica.reportEventWithMap(name, parameters);
//   }
// }

String get defaultLocale => switch (defaultSystemLocale) {
      "ru" => "ru",
      "en" => "en",
      "uz" => "uz",
      _ => "en",
    };

bool isEquals(String a, String b) {
  // log("a: $a, b: $b");
  final String a1 = a
      .toLowerCase()
      .replaceAll(" ", "")
      .replaceAll("'", "")
      .replaceAll("’", "")
      .replaceAll(".", "")
      .replaceAll(",", "")
      .replaceAll("-", "")
      .replaceAll("‘", "")
      .replaceAll("/", "");
  final String b1 = b
      .toLowerCase()
      .replaceAll(" ", "")
      .replaceAll("'", "")
      .replaceAll("’", "")
      .replaceAll(".", "")
      .replaceAll(",", "")
      .replaceAll("-", "")
      .replaceAll("‘", "")
      .replaceAll("/", "");
  // log("a: $a1, b: $b1");
  return a1 == b1;
}

String phoneFormat(String phone) {
  if (phone.length >= 13) {
    String t = phone;
    t = t.replaceAll("+998", "");
    t = "${t.substring(0, 2)} ${t.substring(2, 5)} "
        "${t.substring(5, 7)} ${t.substring(7, 9)}";
    return "+998 $t";
  } else {
    return phone;
  }
}

// String? checkValidEmail(String? value) {
//   if (value == null ||
//       value.isEmpty ||
//       !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//           .hasMatch(value)) {
//     return "enter_valid_email".tr();
//   }
//   return null;
// }
//
// String? checkValidPhone(String? value) {
//   if (value == null ||
//       value.isEmpty ||
//       !RegExp("[0-9]").hasMatch(value.replaceAll(" ", "")) ||
//       value.length != 12) {
//     return "enter_valid_phone".tr();
//   }
//   return null;
// }
//
// String? checkValidEmpty(String? value) {
//   if (value == null || value.isEmpty) {
//     return "enter_valid_value".tr();
//   }
//   return null;
// }
//
// String? checkValidPassword(String? value) {
//   if (value == null || value.isEmpty || value.length < 8) {
//     return "enter_valid_password".tr();
//   }
//   return null;
// }

String formatDuration(Duration? duration) {
  if (duration == null) {
    return "00:00";
  }
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  if (duration.inHours == 0) {
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

// Future<void> setAwaitInit() async {
//   await tts.awaitSpeakCompletion(true);
//   if (Platform.isAndroid) {
//     await Future.wait(<Future<void>>[_getDefaultEngine(), _getDefaultVoice()]);
//   } else if (Platform.isIOS) {
//     await Future.wait(
//       <Future<void>>[
//         tts.setSharedInstance(true),
//         tts.setIosAudioCategory(
//           IosTextToSpeechAudioCategory.ambient,
//           <IosTextToSpeechAudioCategoryOptions>[
//             IosTextToSpeechAudioCategoryOptions.allowBluetooth,
//             IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
//             IosTextToSpeechAudioCategoryOptions.mixWithOthers,
//           ],
//           IosTextToSpeechAudioMode.voicePrompt,
//         ),
//       ],
//     );
//   }
//   await Future.wait(
//     <Future<void>>[
//       tts.setLanguage("en-US"),
//       if (Platform.isIOS) ...<Future<void>>[
//         tts.awaitSpeakCompletion(true),
//         tts.awaitSynthCompletion(true),
//       ]
//     ],
//   );
// }
//
// Future<void> _getDefaultEngine() async {
//   final dynamic engine = await tts.getDefaultEngine;
//   if (engine != null) {
//     if (kDebugMode) {
//       print("engine name: $engine");
//     }
//   }
// }
//
// Future<void> _getDefaultVoice() async {
//   final dynamic voice = await tts.getDefaultVoice;
//   if (voice != null) {
//     if (kDebugMode) {
//       print("voice name: $voice");
//     }
//   }
// }
//
// Future<void> speak(String text) async {
//   await tts.setVolume(1);
//   await tts.speak(text);
// }
//
// Future<void> speakWord(String text) async {
//   await tts.setVolume(1);
//   await tts.setSpeechRate(0);
//   await tts.speak(text);
// }

Color progressColor(int progress) => progress >= 80
    ? const Color.fromRGBO(141, 213, 79, 1)
    : const Color.fromRGBO(255, 162, 0, 1);

Color progressBackgroundColor(int progress) => progress >= 80
    ? const Color.fromRGBO(141, 213, 79, 0.2)
    : const Color.fromRGBO(255, 162, 0, 0.2);

// Future<void> vibrate() async {
//   if (await Vibration.hasVibrator() ?? false) {
//     await Vibration.vibrate(duration: 150);
//   }
// }

List<String> valueToList(String a) {
  List<String> t = <String>[];
  for (int i = 0; i < a.length; i++) {
    if (a[i] == "^") {
      if (i + 1 == a.length) {
        t = <String>[...t, a[i]];
      } else {
        t = <String>[...t, a[i], ""];
      }
    } else {
      if (t.isEmpty) {
        t = <String>[a[i]];
      } else {
        t.last += a[i];
      }
    }
  }
  return t;
}

String? checkEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return "enter_valid_value";
  }
  return null;
}

bool isNewDay(String day1, String day2) =>
    day1.split(" ").first != day2.split(" ").first;

String formatBytesToKB(int bytes) {
  if (bytes < 1024) {
    return "$bytes B";
  } else if (bytes < 1024 * 1024) {
    return "${(bytes / 1024).toStringAsFixed(1)} KB";
  } else if (bytes < 1024 * 1024 * 1024) {
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  } else {
    return "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB";
  }
}

int fileType(String type) {
  switch (type) {
    case "pdf":
      return 200;
    case "docx":
      return 200;
    case "doc":
      return 200;
    case "mp3":
      return 300;
    case "jpeg":
      return 100;
    case "jpg":
      return 100;
    case "png":
      return 100;
    case "ogg":
      return 400;
    case "m4a":
      return 400;
    case "mp4":
      return 500;
    default:
      return 100;
  }
}

List<String> menuItems = <String>[
  "Reply",
  "Edit",
  "Delete",
];

Future<String?> showPopup(
  BuildContext context,
  TapUpDetails details,
  List<String> menus,
) async {
  final Offset offset = details.globalPosition;
  //*show the menu
  final String? value = await showMenu<String>(
    color: context.colorScheme.surface,
    surfaceTintColor: context.colorScheme.surface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy,
      context.width - offset.dx,
      context.height - offset.dy,
    ),
    items: menus
        .map<PopupMenuEntry<String>>(
          (String entry) => PopupMenuItem<String>(
            value: entry,
            height: 32,
            child: Row(
              children: <Widget>[
                Text(entry, style: context.textTheme.titleSmall),
              ],
            ),
          ),
        )
        .toList(),
  );

  return value;
}

// Future<File> compressAndGetFile(File file) async {
//   if (file.path.endsWith(".png") ||
//       file.path.endsWith(".jpg") ||
//       file.path.endsWith(".jpeg")) {
//     final List<String> t = file.path.split(".");
//     final String targetPath = "${t.first}_compressed.${t.last}";
//     final XFile? result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       targetPath,
//     );
//     if (result == null) {
//       return file;
//     }
//     return File(result.path);
//   }
//   return file;
// }

String countToTime(num count) {
  final int minute = count ~/ 60;
  final int second = (count % 60).toInt();
  return "0$minute:${second < 10 ? "0$second" : second}";
}

/// Get screen media.
final MediaQueryData media =
// ignore: deprecated_member_use
    MediaQueryData.fromView(WidgetsBinding.instance.window);
