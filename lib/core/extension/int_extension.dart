part of "extension.dart";

/// Get screen media.
final MediaQueryData media =
// ignore: deprecated_member_use
    MediaQueryData.fromView(WidgetsBinding.instance.window);

extension IntX on int {
  bool get isPaymentAccess => this == 100;
}

/// This extention help us to make widget responsive.
extension NumberParsing on num {
  double w() => this * media.size.width / 100;

  double h() => this * media.size.height / 100;
}

///
extension StringExtension on String {
  String? get appendZeroPrefix => length <= 1 ? "0$this" : this;
}

/// This extention help us to make widget responsive.
extension IntExtension on num {
  String get formattedTime {
    final String sec = (this % 60).toString();
    final String min = (this / 60).floor().toString();
    return "${min.appendZeroPrefix}:${sec.appendZeroPrefix}";
  }
}
