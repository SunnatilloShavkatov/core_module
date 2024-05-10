part of "extension.dart";

extension DifferenceDateTime on DateTime {
  int get inDifSeconds => DateTime.now().difference(this).inSeconds;
}

extension ParseString on DateTime {
  String get formatDate => DateFormat("dd.MM.yyyy").format(this);

  String get yyyyMMddHHmm => DateFormat("yyyy-MM-dd HH:mm").format(this);

  String get formatDateTime =>
      DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(this);

  String get telegramFormat => DateFormat("HH:mm").format(this);

  String timeZone() {
    String date = toIso8601String().split(".")[0];
    if (timeZoneOffset.isNegative) {
      date += "-";
    } else {
      date += "+";
    }
    final List<String> timeZoneSplit = timeZoneOffset.toString().split(":");
    final int hour = int.parse(timeZoneSplit[0]);
    if (hour < 10) {
      date += "0${timeZoneSplit[0]}";
    }
    return "$date:${timeZoneSplit[1]}";
  }
}

extension ParseExtension on String {
  bool get isEditable =>
      DateTime.tryParse(this) != null &&
      DateTime.tryParse(this)!.isAfter(
        DateTime.now().subtract(const Duration(days: 1)),
      );

  String get telegramTime => isEmpty
      ? ""
      : DateFormat("HH:mm").format(DateTime.tryParse(this) ?? DateTime.now());

  String telegramDay() {
    if (isEmpty) {
      return "";
    }
    final DateTime now = DateTime.now();
    final DateTime date = DateTime.tryParse(this) ?? now;
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return "Today";
    }
    return DateFormat("MMMM dd").format(date);
  }

  String Function() get date => () {
        if (isEmpty) {
          return "";
        }
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(this);
        return DateFormat("dd.MM.yyyy").format(
          date.add(Duration(hours: duration)),
        );
      };

  String Function() get dateTime => () {
        if (isEmpty) {
          return "";
        }
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(this);
        return DateFormat("dd.MM.yyyy HH:mm").format(
          date.add(Duration(hours: duration)),
        );
      };

  String time() {
    if (isEmpty) {
      return "";
    }
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(this);
    return DateFormat("HH:mm").format(date.add(Duration(hours: duration)));
  }

  String get htmlToText => Bidi.stripHtmlIfNeeded(this);
}
