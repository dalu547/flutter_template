import 'package:dio/dio.dart';
import 'package:template/app/utils/app_logger.dart';

//todo : implement this properly later.
class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    AppLogger.error("Error occurred: $error");
    AppLogger.error("Stack trace: $stackTrace");
    AppLogger.error("Request options: ${options.method} ${options.uri}");
  }
}
