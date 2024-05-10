import "package:dio/dio.dart" hide Headers;

import "package:core_module/core/error/failure.dart";

final class ServerError implements Exception {
  ServerError.withDioError({required DioException error}) {
    _handleError(error);
  }

  ServerError.withError({
    required String message,
    int? code,
  }) {
    _errorMessage = message;
    _errorCode = code;
  }

  int? _errorCode;
  String _errorMessage = "";

  int get errorCode => _errorCode ?? 0;

  String get message => _errorMessage;

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        _errorMessage = "Connection error";
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
      case DioExceptionType.sendTimeout:
        _errorMessage = "Send timeout";
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout";
      case DioExceptionType.badResponse:
        {
          _errorCode = error.response?.statusCode ?? 500;
          if (_errorCode == 403 || _errorCode == 401) {
            _errorMessage = "Token expired";
            return;
          }
          if (_errorCode == 500 || _errorCode == 503 || _errorCode == 502) {
            _errorMessage = "Server error";
            return;
          }
          if (_errorCode == 404) {
            _errorMessage = "Not Found";
            return;
          }
          if (_errorCode == 413) {
            _errorMessage = "Request Entity Too Large";
            return;
          }
          if (error.response?.data is String) {
            _errorMessage = error.response!.data;
            return;
          } else if (error.response?.data is Map<String, dynamic>) {
            final Map<String, dynamic> data = error.response!.data;
            final List<dynamic> errors = data["errors"];
            if (errors.isNotEmpty) {
              final Map<String, dynamic> first = errors.first;
              _errorMessage = first["message"].toString();
            }
          } else {
            _errorMessage = "Something wrong";
          }
          break;
        }
      case DioExceptionType.cancel:
        _errorMessage = "Canceled";
      case DioExceptionType.unknown:
        _errorMessage = "Something wrong";
      case DioExceptionType.badCertificate:
        _errorMessage = "Bad certificate";
    }
    return;
  }
}

extension ServerErrorExtension on ServerError {
  bool get isTokenExpired => errorCode == 401;

  ServerFailure get failure => ServerFailure(
        message: message,
        statusCode: errorCode,
      );
}
