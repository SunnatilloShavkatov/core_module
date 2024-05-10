part of "extension.dart";

const String pattern =
    r"^(?:https?:\/\/)?(?:www\.)?(?:m\.|youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|shorts\/))((\w|-){11})(?:\S+)?$";
const String shortsUrlPattern =
    r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/";
const String contentUrlPattern =
    r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?";
const String embedUrlPattern =
    r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/";
const String altUrlPattern = r"^https:\/\/youtu\.be\/";
const String musicUrlPattern = r"^https:\/\/(?:music\.)?youtube\.com\/watch\?";
const String idPattern = r"([_\-a-zA-Z0-9]{11}).*$";
final RegExp regExp = RegExp(pattern);
final RegExp shortsRegExp = RegExp(shortsUrlPattern);

extension StringsX on String {
  bool get isUrl => contains("http") || contains("https");

  String get fileName => split("/").last.split(".").first;

  String get type => split(".").last;

  bool get isYoutubeUrl => isValidYoutubeURL(this);

  String get youtubeWebpThumbnail =>
      getThumbnail(videoId: convertUrlToId(this) ?? "");
}

extension ListStringX on List<String> {
  bool isFilled() {
    bool isFilled = isNotEmpty;
    for (final String text in this) {
      if (text.isEmpty) {
        isFilled = false;
        break;
      }
    }
    return isFilled;
  }
}

bool isValidYoutubeURL(String url) => regExp.hasMatch(url);

String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) {
    return url;
  }
  String url0 = url;
  if (trimWhitespaces) {
    url0 = url.trim();
  }

  for (final String regex in <String>[
    "${contentUrlPattern}v=$idPattern",
    "$embedUrlPattern$idPattern",
    "$altUrlPattern$idPattern",
    "$shortsUrlPattern$idPattern",
    "$musicUrlPattern?v=$idPattern",
  ]) {
    final Match? match = RegExp(regex).firstMatch(url0);
    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    }
  }

  return null;
}

String getThumbnail({
  required String videoId,
  String quality = ThumbnailQuality.high,
  bool webp = true,
}) =>
    webp
        ? "https://i3.ytimg.com/vi_webp/$videoId/$quality.webp"
        : "https://i3.ytimg.com/vi/$videoId/$quality.jpg";
