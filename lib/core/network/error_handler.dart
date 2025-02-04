import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:template/app/resources/strings_manager.dart';
import 'package:template/core/network/response_error.dart';

enum ErrorType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late ResponseError responseError;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      responseError = _handleError(error);
    } else {
      // default error
      responseError = ErrorType.DEFAULT.getResponseError();
    }
  }

  //Handlling dio client errors/exceptions.(From API response)
  ResponseError _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorType.CONNECT_TIMEOUT.getResponseError();
      case DioExceptionType.sendTimeout:
        return ErrorType.SEND_TIMEOUT.getResponseError();
      case DioExceptionType.receiveTimeout:
        return ErrorType.RECEIVE_TIMEOUT.getResponseError();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return ErrorType.BAD_REQUEST.getResponseError();
          case ResponseCode.FORBIDDEN:
            return ErrorType.FORBIDDEN.getResponseError();
          case ResponseCode.UNAUTHORISED:
            return ErrorType.UNAUTHORISED.getResponseError();
          case ResponseCode.NOT_FOUND:
            return ErrorType.NOT_FOUND.getResponseError();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return ErrorType.INTERNAL_SERVER_ERROR.getResponseError();
          default:
            return ErrorType.DEFAULT.getResponseError();
        }
      case DioExceptionType.cancel:
        return ErrorType.CANCEL.getResponseError();
      case DioExceptionType.unknown:
        return ErrorType.DEFAULT.getResponseError();
      case DioExceptionType.badCertificate:
        return ErrorType.DEFAULT
            .getResponseError(); //But handle badCertificate later.
      case DioExceptionType.connectionError:
        return ErrorType.DEFAULT
            .getResponseError(); //But handle connectionError later.
    }
  }
}

extension ErrorTypeExtension on ErrorType {
  ResponseError getResponseError() {
    switch (this) {
      case ErrorType.BAD_REQUEST:
        return ResponseError(
            ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST.tr());
      case ErrorType.FORBIDDEN:
        return ResponseError(
            ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN.tr());
      case ErrorType.UNAUTHORISED:
        return ResponseError(
            ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED.tr());
      case ErrorType.NOT_FOUND:
        return ResponseError(
            ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND.tr());
      case ErrorType.INTERNAL_SERVER_ERROR:
        return ResponseError(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR.tr());
      case ErrorType.CONNECT_TIMEOUT:
        return ResponseError(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT.tr());
      case ErrorType.CANCEL:
        return ResponseError(ResponseCode.CANCEL, ResponseMessage.CANCEL.tr());
      case ErrorType.RECEIVE_TIMEOUT:
        return ResponseError(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT.tr());
      case ErrorType.SEND_TIMEOUT:
        return ResponseError(
            ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT.tr());
      case ErrorType.CACHE_ERROR:
        return ResponseError(
            ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR.tr());
      case ErrorType.NO_INTERNET_CONNECTION:
        return ResponseError(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION.tr());
      case ErrorType.DEFAULT:
        return ResponseError(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return ResponseError(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.noContent; // success with no content
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, api rejected our request
  static const String FORBIDDEN =
      AppStrings.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String NOT_FOUND = AppStrings
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String DEFAULT =
      AppStrings.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppStrings.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppStrings.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppStrings.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
