// import "dart:developer";
// import "dart:io";
//
// import "package:dio/dio.dart";
// import "package:core_module/constants/constants.dart";
// import "package:core_module/features/profile/data/models/upload_file_response.dart";
// import "package:core_module/features/profile/domain/entities/upload_file_entity.dart";
// import "package:flutter/foundation.dart";
// import "package:http_parser/http_parser.dart";
// import "package:path/path.dart" as p;
// import "package:path_provider/path_provider.dart";
//
// Future<List<UploadFileEntity>> fileUpload({
//   required File file,
//   required String token,
//   required void Function(int, int) onSendProgress,
// }) async {
//   final List<UploadFileEntity> files = await compute<
//       (File, String, void Function(int, int), String, String),
//       List<UploadFileEntity>>(
//     uploadFileIsolate,
//     (
//       file,
//       token,
//       onSendProgress,
//       Constants.baseUrl,
//       Constants.apiToken,
//     ),
//   );
//   return files;
// }
//
// Future<List<UploadFileEntity>> uploadFileIsolate(
//   (
//     File,
//     String,
//     void Function(int, int),
//     String baseUrl,
//     String apiToken,
//   ) args,
// ) async {
//   try {
//     final Dio dio = Dio();
//     final File file = args.$1;
//     final String fileName = file.path.split("/").last;
//     final String type = file.path.split(".").last;
//     final Response<dynamic> response = await dio.post(
//       args.$4 + Urls.uploadFile,
//       options: Options(
//         headers: <String, String>{
//           "Content-Encoding": "gzip, deflate, br",
//           "Accept-Encoding": "gzip",
//           "api-token": args.$5,
//           "Authorization": args.$2,
//         },
//       ),
//       data: FormData.fromMap(
//         <String, dynamic>{
//           "file": await MultipartFile.fromFile(
//             file.path,
//             filename: fileName,
//             contentType: MediaType(
//               switch (type) {
//                 "jpg" => "image",
//                 "png" => "image",
//                 "jpeg" => "image",
//                 "pdf" => "application",
//                 "mp3" => "audio",
//                 "m4a" => "audio",
//                 "mp4" => "video",
//                 "ogg" => "audio",
//                 _ => "",
//               },
//               type,
//             ),
//           ),
//         },
//       ),
//       onSendProgress: args.$3,
//     );
//     final int statusCode = response.statusCode ?? 500;
//     if (statusCode >= 200 && statusCode < 300) {
//       return UploadFileResponse.fromJson(response.data).toEntity();
//     } else {
//       return <UploadFileEntity>[];
//     }
//   } on Exception catch (error, stacktrace) {
//     log("Exception occurred: $error stacktrace: $stacktrace");
//     return <UploadFileEntity>[];
//   }
// }
//
// Future<String> startDownloading(
//   String url,
//   void Function(int, int) okCallback,
// ) async {
//   final String fileName = url.split("/").last;
//   final String? path = await getVoiceFilePath(fileName);
//   if (path == null) {
//     return "";
//   }
//   if (File(path).existsSync()) {
//     return path;
//   }
//   try {
//     return await Dio().download(
//       url,
//       path,
//       onReceiveProgress: (int recivedBytes, int totalBytes) {
//         okCallback(recivedBytes, totalBytes);
//       },
//     ).then((_) => path);
//   } on Exception catch (e) {
//     debugPrint("Exception$e");
//   }
//   return path;
// }
//
// Future<String?> getVoiceFilePath(String filename) async {
//   late Directory dir;
//   String workDir = "";
//   try {
//     dir = await getTemporaryDirectory();
//     workDir = p.join(dir.path, "voice");
//     return "$workDir/$filename";
//   } on Exception catch (err) {
//     debugPrint("Cannot get download folder path $err");
//     return null;
//   }
// }
