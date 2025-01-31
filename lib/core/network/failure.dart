import 'package:template/core/network/error_handler.dart';

class ResponseError {
  int code; // 200 or 400
  String message; // error or success

  ResponseError(this.code, this.message);
}

class DefaultResponseError extends ResponseError {
  DefaultResponseError() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
