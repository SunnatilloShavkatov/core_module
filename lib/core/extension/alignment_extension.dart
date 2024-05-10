part of "extension.dart";

extension AlignmentX on bool {
  Alignment get toAlignment =>
      this ? Alignment.centerRight : Alignment.centerLeft;
}
